module Codebreaker
	class Game
		def initialize(**options)
			@console = options[:console]
			@configurator = options[:configurator]
		end

		def start
			@console.puts Codebreaker::Messages.welcome
			campaign = Codebreaker::Campaign.new
			loop do
				begin
					next_match = Codebreaker::Match.new(
						console: @console, 
						match_number: campaign.size + 1, 
						secret_code: @configurator.secret_code, 
						attempts: @configurator.attempts, 
            guesser: Codebreaker::Guesser.new(number_length: @configurator.number_length, max_digit: @configurator.max_digit)
						)
					next_match.play
					campaign.add(next_match)
					break unless play_again?
				rescue Codebreaker::InvalidSecretCode => e
					@console.puts Codebreaker::Messages.error(e.code)
					break
				end
			end
			@console.puts Codebreaker::Messages.statistics(campaign)
			@console.puts Codebreaker::Messages.game_over
		end

		private

		def play_again?
			@console.puts Codebreaker::Messages.play_again
			@console.gets&.strip&.downcase == 'y'
		end
	end
end
