module Codebreaker
	class Configurator
		attr_reader :attempts, :guesser
		
		def initialize(attempts:, number_length:, max_digit:)
			@attempts = attempts
      @secret_coder = SecretCoder.new(number_length: number_length, max_digit: max_digit)
      @guesser = Guesser.new(number_length: number_length, max_digit: max_digit)
		end

    def secret_code
      @secret_coder.secret_code
    end
	end
end