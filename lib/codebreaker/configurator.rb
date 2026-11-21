module Codebreaker
	class Configurator
		attr_reader :attempts, :code_generator, :number_length, :max_digit
		
		def initialize(code_generator: Codebreaker::NumbersGenerator, attempts:, number_length:, max_digit:)
			@attempts = attempts
      @number_length = number_length
      @max_digit = max_digit
			@code_generator = code_generator
		end
		
		def secret_code
			raw = code_generator.generate
			Codebreaker::SecretCode.parse(raw)
		end
	end
end