module Codebreaker
	class Messages
		ERROR_MESSAGES = {
      		invalid_length: 'You need to enter exactly 4 digits',
      		out_of_range: 'Digits must be from 1 to 6' # например, если добавится еще правило
    	}.freeze

		def self.welcome
			"Welcome to Codebreaker!\nEnter guess:"
		end

		def self.prompt(attempts_left)
			"#{attempts_left} attempts left"
		end

		def self.mark(marker)
      		marker.to_s
    	end

		def self.error(error_code)
			message = ERROR_MESSAGES[error_code] || 'Unknown error'
    		"Error: #{message}. Attempt not counted."
		end

		def self.result(session)
			if session.won?
        		"Congratulations! You won!"
      		elsif session.lost?
      			"You lose! The secret code is #{session.secret_code}"
      		end
		end
	end
end