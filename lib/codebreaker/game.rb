module Codebreaker
	class Game

		def initialize(input: $stdin, output: $stdout)
			@input = input
			@output = output
		end

		def start
			@output.puts("Welcome to Codebreaker!")
			@secret_code = generate_secret
			@output.puts("Enter guess:")
			loop do
				result = Marker.mark(@secret_code, @input.gets.chomp)
				@output.puts(result)
				break if result == "++++"
			end
			@output.puts("Congratulations! You won!")
		end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end
	end
end
