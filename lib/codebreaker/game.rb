module Codebreaker
	class Game
		def initialize(**options)
			@console = options[:console]
			@configurator = options[:configurator]
			@matches = []
		end

		def start
			@console.puts Codebreaker::Messages.welcome
			loop do
				begin
					next_match = Codebreaker::Match.new(
						console: @console, 
						match_number: @matches.size + 1, 
						secret_code: @configurator.secret_code, 
						attempts: @configurator.attempts
						)
					next_match.play
					@matches << next_match
					break unless play_again?
				rescue Codebreaker::InvalidSecretCode => e
					@console.puts Codebreaker::Messages.error(e.code)
					break
				end
			end
			@console.puts Codebreaker::Messages.game_over
		end

		private

		def play_again?
			@console.puts Codebreaker::Messages.play_again
			@console.gets&.strip&.downcase == 'y'
		end
	end
end
