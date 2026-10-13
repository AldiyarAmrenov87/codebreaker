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
				break if result == "++++"
			end
			@output.puts("Congratulations! You won!")
		end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end

		def playing?
			@status == :playing
		end
	end
end
