module Codebreaker
  class SecretCoder
    def initialize(number_length:, max_digit:)
      @number_length = number_length
      @max_digit = max_digit
    end

    def secret_code(raw)
      cleaned = raw.to_s.strip
      validate!(cleaned)
      Codebreaker::SecretCode.new(cleaned)
    end

    private

    def validate!(value)
      return if value.is_a?(String) && format.match?(value)

      raise Codebreaker::InvalidSecretCode, :invalid_format
    end

    def format
      @format ||= /\A[0-#{@max_digit}]{#{@number_length}}\z/
    end
  end
end