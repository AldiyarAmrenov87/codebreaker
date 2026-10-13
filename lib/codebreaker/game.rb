module Codebreaker
	class Game

		attr_reader :attempts

		def initialize(input: $stdin, output: $stdout, attempts: 10)
			@input = input
			@output = output
			@attempts = attempts
			@status = :playing
		end

		def start
			@output.puts("Welcome to Codebreaker!")
			@secret_code = generate_secret
			@output.puts("Enter guess:")
			while playing? do
				result = Marker.mark(@secret_code, @input.gets.chomp)
				@attempts -= 1
				@output.puts(result)
				if result == "++++"
					@status = :won
				elsif no_attempts_left?
					@status = :lost
				end
			end

			if won?
				@output.puts("Congratulations! You won!")
			elsif lost? 
				@output.puts("You lose! The secret code is #{@secret_code}")
			end
		end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end

		def playing?
			@status == :playing
		end

		def lost?
			@status == :lost
		end

		def won?
			@status == :won
		end

		def no_attempts_left?
			@attempts == 0
		end
	end
end
