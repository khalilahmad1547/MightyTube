# frozen_string_literal: true

module Sessions
  class Create
    include ApplicationService

    class Contract < ApplicationContract
      params do
        required(:email).filled(:string)
        required(:password).filled(:string)
      end
    end

    def execute(params)
      @params = params

      yield find_user
      yield match_password
      jwt = JWT::Encoder.call(current_user: user)
      Success({ jwt: })
    end

    private

    attr_reader :params, :user

    def find_user
      @user = User.find_by(email: params[:email])
      return Failure(:unauthorized) if user.nil?

      Success(user)
    end

    def match_password
      return Success(user) if user.valid_password?(params[:password])

      Failure(:unauthorized)
    end
  end
end
