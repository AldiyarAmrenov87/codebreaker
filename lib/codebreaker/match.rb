module Codebreaker
	class Match
		attr_reader :session, :attempts

		def initialize(console:, match_number:, secret_code:, attempts:, guesser:)
			@console = console
			@match_number = match_number
			@secret_code = secret_code
			@attempts = attempts
      @guesser = guesser
		end

		def play
			@console.puts Codebreaker::Messages.match_number(@match_number)
			session = Session.new(secret_code: @secret_code, attempts: @attempts)
			while session.playing? do
				@console.puts Codebreaker::Messages.prompt(session.attempts)
				raw = @console.gets
				break if raw.nil?
				begin
					parsed = @guesser.guess(raw)
					marker = session.guess(parsed)
					@console.puts Codebreaker::Messages.mark(marker)
				rescue Codebreaker::InvalidGuess => e
					@console.puts Codebreaker::Messages.error(e.object_name, e.code)
				end
			end
			if session.won?
				@console.puts Codebreaker::Messages.result(session)
			elsif session.lost? 
				@console.puts Codebreaker::Messages.result(session)
			end
			@session = session
		end

    def won?      = @session&.won?  || false
    def lost?     = @session&.lost? || false
	end
end