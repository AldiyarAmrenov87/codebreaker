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

		def matches?(guess)
		  value == guess
		end
	end
end