# frozen_string_literal: true

module JWT
  class Decoder
    include ApplicationService

    class Contract < ApplicationContract
      params do
        required(:token).filled(:string)
      end
    end

    def execute(params)
      @token = params[:token]
      decode
    end

    private

    attr_reader :token

    def decode
      algo = { algorithm: 'HS256' }
      jwt_secret = ENV.fetch('JWT_SECRET', nil)
      JWT.decode(token, jwt_secret, true, algo).first['data']
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
      nil
    end
  end
end
