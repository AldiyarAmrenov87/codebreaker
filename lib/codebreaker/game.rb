module Codebreaker
	class Game
		attr_accessor :secret_code

		def initialize(output)
			@output = output
		end

		def start
			@output.puts("Welcome to Codebreaker!")
			@output.puts("Enter guess:")
		end

		def guess(guess)
		end
	end
end