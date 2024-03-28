# frozen_string_literal: true

module Api::V0
  class ApiController < ActionController::API
    before_action :check_headers!, :decode_jwt!, :authenticate_current_user!

    rescue_from StandardError do |exception|
      case exception.class.name
      when ActiveRecord::RecordInvalid.name then unprocessable_entity(exception.message)
      else process_standard_error(exception)
      end
    end

    private

    def process_standard_error(exception)
      render json: { errors: exception.message }, status: :internal_server_error
    end

    def check_headers!
      unauthorized_response if request.headers['jwt'].blank?
    end

    def decode_jwt!
      @data = JWT::Decoder.call({ token: request.headers['jwt'] })
      unauthorized_response if @data.blank?
    end

    def current_user
      return if @data.blank? || @data['user_id'].blank?

      @current_user ||= User.find_by(id: @data['user_id'])
    end

    def authenticate_current_user!
      unauthorized_response unless current_user
    end

    def unauthorized_response(reason = 'You are unauthorized to view this resource')
      render json: { errors: [reason] }, status: :unauthorized
    end

    def not_found_response(reason = 'The requested resource does not exist')
      render json: { errors: [reason] }, status: :not_found
    end

    def unprocessable_entity(reason)
      render json: { errors: [reason] }, status: :unprocessable_entity
    end

    def forbidden_response
      head :forbidden
    end
  end
end
