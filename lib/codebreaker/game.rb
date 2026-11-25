module Codebreaker
	class Game
		def initialize(**options)
			@console = options[:console]
      @attempts = options[:attempts]
			@code_generator = options[:code_generator]

      @secret_coder = SecretCoder.new(
        number_length: @code_generator.number_length, 
        max_digit: @code_generator.max_digit
        )
      @guesser = Guesser.new(
        number_length: @code_generator.number_length, 
        max_digit: @code_generator.max_digit
        )
		end

		def start
			@console.puts Codebreaker::Messages.welcome
			campaign = Codebreaker::Campaign.new
			loop do
        begin
          raw = @code_generator.generate
          break if raw.nil?
          secret_code = @secret_coder.secret_code(raw)
    	
          next_match = Codebreaker::Match.new(
  					console: @console, 
  					match_number: campaign.size + 1, 
  					secret_code: secret_code, 
  					attempts: @attempts, 
            guesser: @guesser
  					)
  				next_match.play
  				campaign.add(next_match)
  				break unless play_again?
        rescue Codebreaker::InvalidSecretCode => e
          @console.puts Codebreaker::Messages.error(e.object_name, e.code)
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
