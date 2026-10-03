module Codebreaker
	class Game

		def initialize(input: $stdin, output: $stdout)
			@input = input
			@output = output
		end

		def start
			@output.puts("Welcome to Codebreaker!")
			@output.puts("Enter guess:")
			@secret_code = generate_secret
			result = Marker.mark(@secret_code, @input.gets.chomp)
			@output.puts(result)
		end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end
	end
end
