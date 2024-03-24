# frozen_string_literal: true

module JWT
  class Encoder
    include ApplicationService

    class Contract < ApplicationContract
      params do
        optional(:exp).maybe(:integer)
      end
    end

    def execute(params, current_user:)
      @exp = params[:exp] || (Time.now.to_i + Constants::SESSION_LIFETIME)
      @current_user = current_user
      encode
    end

    private

    attr_reader :exp, :current_user

    def encode
      data = { user_id: current_user.id }
      jwt_secret = ENV.fetch('JWT_SECRET', nil)
      JWT.encode({ data:, exp: }, jwt_secret, 'HS256')
    end
  end
end
