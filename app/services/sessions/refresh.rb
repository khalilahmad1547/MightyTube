# frozen_string_literal: true

module Sessions
  class Refresh
    include ApplicationService

    class Contract < ApplicationContract
      params do
        optional(:exp).maybe(:integer)
      end
    end

    def execute(_params, current_user:)
      @current_user = current_user

      jwt = JWT::Encoder.call(current_user:)
      Success({ jwt: })
    end

    private

    attr_reader :current_user
  end
end
