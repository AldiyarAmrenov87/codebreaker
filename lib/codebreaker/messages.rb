module Codebreaker
	class Messages
    ERROR_MESSAGES = {
      guess: {
        invalid_format: 'Please, follow the format for guesses. Attempt not counted.'
      },
      secret_code: {
        invalid_format: 'The secret code format is invalid. Sorry, we will fix it as soon as possible.'
      },
    }.freeze

		def self.welcome
			"Welcome to Codebreaker!"
		end

		def self.match_number(number_of_match)
			"Round ##{number_of_match}."
		end

		def self.prompt(attempts_left)
			"Enter guess (#{attempts_left} attempts left):"
		end

		def self.mark(marker)
     	marker.to_s
    end

		def self.error(object_name, error_code)
			message = ERROR_MESSAGES[object_name][error_code] || 'Unknown error'
    	"#{message}"
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

    def self.statistics(campaign)
      <<~TEXT
        === Campaign summary ===
        Matches: #{campaign.total}
        Won:     #{campaign.won_count}
        Lost:    #{campaign.lost_count}
      TEXT
    end

		def self.game_over
			'Game over!'
		end
	end
end