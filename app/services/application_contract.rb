# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  config.messages.backend = :i18n

  register_macro(:email_format) do
    regexp = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

    key.failure(:email_format) if key? && value.present? && !regexp.match?(value)
  end
end
