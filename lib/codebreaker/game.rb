module Codebreaker
	class Game

		attr_reader :attempts, :secret_code

		def initialize(**options)
			@console = options[:console]
			@attempts = options[:attempts]
			@status = :playing
		end

		def start
			@console.puts Codebreaker::Messages.welcome
			@secret_code = Codebreaker::SecretCode.generate
			
			while playing? do
				raw = @console.gets
				break if raw.nil?

				begin
					parsed = Codebreaker::Guess.parse(raw)
					
					@attempts -= 1
					@console.puts Codebreaker::Messages.prompt(attempts)
		
					marker = Marker.evaluate(secret_code_value: @secret_code.value, guess_value: parsed.value)
					@console.puts Codebreaker::Messages.mark(marker)
					
					if @secret_code.matches?(parsed.value)
						@status = :won
					elsif no_attempts_left?
						@status = :lost
					end
				rescue Codebreaker::InvalidGuess => e
					@console.puts Codebreaker::Messages.error(e.code)
				end
			end

			if won?
				@console.puts Codebreaker::Messages.result(self)
			elsif lost? 
				@console.puts Codebreaker::Messages.result(self)
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
