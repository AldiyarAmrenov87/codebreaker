module Codebreaker
	class NumbersGenerator
		LENGTH = 4
		DIGITS = ('0'..'5').to_a
		def self.generate
			DIGITS.sample(LENGTH).join
		end
	end
end