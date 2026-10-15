module Codebreaker
	class Game
		
		def self.generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end

		attr_reader :attempts

		def initialize(console:, attempts: 10)
			@console = console
			@attempts = attempts
			@status = :playing
		end

		def start
			@console.puts("Welcome to Codebreaker!")
			@secret_code = self.class.generate_secret
			@console.puts("Enter guess:")
			while self.class.playing? do
				result = Marker.mark(@secret_code, @console.gets.chomp)
				@attempts -= 1
				@console.puts(result)
				if result == "++++"
					@status = :won
				elsif no_attempts_left?
					@status = :lost
				end
			end

			if won?
				@console.puts("Congratulations! You won!")
			elsif lost? 
				@console.puts("You lose! The secret code is #{@secret_code}")
			end
		end


		def self.playing?
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
