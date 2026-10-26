module Codebreaker
	class Session
		Attempt = Data.define(:guess, :marker)

		attr_reader :secret_code, :attempts, :history
		
		def initialize(secret_code:, attempts:)
			@secret_code = secret_code
			@attempts = attempts
			@history = []
			@state = :playing
		end

		def guess(guess)
			marker = Codebreaker::Marker.evaluate(secret_code: @secret_code, guess: guess)
			
			@attempts -= 1
			@history << Attempt.new(guess: guess, marker: marker)

			transition!

			return marker
		end

		def playing? = @state == :playing
		def won? = @state == :won
		def lost? = @state == :lost

		private

		def transition!
			current_attempt = @history.last
			if @secret_code.matches?(current_attempt.guess)
				@state = :won
			elsif @attempts.zero?
				@state = :lost
			end
		end
	end
end