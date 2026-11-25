module Codebreaker
	class SecretCode
		attr_reader :value

		def initialize(value)
		  @value = value
		end

		def matches?(guess)
		  value == guess.value
		end

		def to_s
			@value
		end
	end
end