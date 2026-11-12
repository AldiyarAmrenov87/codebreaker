module Codebreaker
	class Messages
		ERROR_MESSAGES = {
      guess_invalid_length: 'You need to enter exactly 4 digits. Attempt not counted.',
      out_of_range: 'Digits must be from 1 to 6', # например, если добавится еще правило
      secret_code_invalid_length: 'The secret code must consist of 4 digits. Sorry, we will fix it as soon as possible.'
    }.freeze

		def self.welcome
			"Welcome to Codebreaker!"
		end

		def self.session_number(number_of_sessions)
			"Round ##{number_of_sessions}."
		end

		def self.prompt(attempts_left)
			"Enter guess (#{attempts_left} attempts left):"
		end

		def self.mark(marker)
     	marker.to_s
    end

		def self.error(error_code)
			message = ERROR_MESSAGES[error_code] || 'Unknown error'
    	"Error: #{message}"
		end

		def self.result(session)
			if session.won?
       	"Congratulations! You won!"
      elsif session.lost?
      	"You lose! The secret code is #{session.secret_code}"
      end
		end

		def self.play_again
			'Play again? (y/n):'
		end

		def self.game_over
			'Game over!'
		end
	end
end