module Codebreaker
	class Game

		attr_reader :attempts

		def initialize(**options)
			@console = options[:console]
			@attempts = options[:attempts]
			@status = :playing
		end

		def start
			@console.puts("Welcome to Codebreaker!")
			@secret_code = Codebreaker::SecretCode.generate
			@console.puts("Enter guess:")
			
			while playing? do
				raw = @console.gets
				break if raw.nil?

				begin
					parsed = Codebreaker::Guess.parse(raw)
					result = Marker.mark(@secret_code.value, parsed.value)
					@attempts -= 1
					@console.puts(result)
					@console.puts("#{attempts} attempts left")
					if result == "++++"
						@status = :won
					elsif no_attempts_left?
						@status = :lost
					end
				rescue InvalidGuess => e
					@console.puts "Error: #{e.message}. Attempt not counted."
				end
			end

			if won?
				@console.puts("Congratulations! You won!")
			elsif lost? 
				@console.puts("You lose! The secret code is #{@secret_code.value}")
			end
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
