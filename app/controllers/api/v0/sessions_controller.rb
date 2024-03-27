# frozen_string_literal: true

module Api::V0
  class SessionsController < ApiController
    skip_before_action :check_headers!, :decode_jwt!, :authenticate_current_user!, only: [:create]

    def create
      Sessions::Create.call(params.to_unsafe_h) do |result|
        result.success { |jwt| render json: jwt, status: :ok }

        result.failure(:unauthorized) { unauthorized_response }

        result.failure { |errors| render json: errors, status: :unprocessable_entity }
      end
    end

    def refresh
      Sessions::Refresh.call(params.to_unsafe_h, current_user:) do |result|
        result.success { |jwt| render json: jwt, status: :ok }

        result.failure(:unauthorized) { unauthorized_response }

        result.failure { |errors| render json: errors, status: :unprocessable_entity }
      end
    end
  end
end
