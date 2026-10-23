module Codebreaker
	class Game
		def initialize(**options)
			@console = options[:console]
			@attempts = options[:attempts]
		end

		def start
			@console.puts Codebreaker::Messages.welcome
			secret_code = Codebreaker::SecretCode.generate
			session = Session.new(secret_code: secret_code, attempts: @attempts)
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
		end
	end
end
