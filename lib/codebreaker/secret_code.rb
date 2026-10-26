module Codebreaker
	class SecretCode
		LENGTH = 4
		DIGITS = ('0'..'9').to_a

		def self.generate
		  new(DIGITS.sample(LENGTH).join)
		end

		attr_reader :value

		def initialize(value)
		  @value = value
		end

		def matches?(guess_value)
		  value == guess_value
		end

		def to_s
			@value
		end
	end
end