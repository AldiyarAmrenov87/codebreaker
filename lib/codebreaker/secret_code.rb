module Codebreaker
	class SecretCode
		FORMAT = /\A\d{4}\z/

		def self.parse(raw)
      new(raw.to_s.strip)
    end

		attr_reader :value

		def initialize(value)
		  @value = value
		  validate!
		end

		def matches?(guess)
		  value == guess.value
		end

		def to_s
			@value
		end

		private

    def validate!
      return if FORMAT.match?(value)
      raise Codebreaker::InvalidSecretCode, :secret_code_invalid_length
    end
	end
end