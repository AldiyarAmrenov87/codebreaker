module Codebreaker
	class Game
		def initialize(**options)
			@console = options[:console]
			@configurator = options[:configurator]
			@game_sessions = []
		end

		def start
			@console.puts Codebreaker::Messages.welcome
			loop do
				begin
					secret_code = @configurator.secret_code
					session = Session.new(secret_code: secret_code, attempts: @configurator.attempts)
					@game_sessions << session
					@console.puts Codebreaker::Messages.session_number(@game_sessions.size)
					while session.playing? do
						@console.puts Codebreaker::Messages.prompt(session.attempts)
						raw = @console.gets
						break if raw.nil?
						begin
							parsed = Codebreaker::Guess.parse(raw)

							marker = session.guess(parsed)
							@console.puts Codebreaker::Messages.mark(marker)
						rescue Codebreaker::InvalidGuess => e
							@console.puts Codebreaker::Messages.error(e.code)
						end
					end
					if session.won?
						@console.puts Codebreaker::Messages.result(session)
					elsif session.lost? 
						@console.puts Codebreaker::Messages.result(session)
					end
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
