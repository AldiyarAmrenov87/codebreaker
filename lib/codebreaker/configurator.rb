module Codebreaker
	class Configurator
		attr_reader :attempts, :code_generator
		
		def initialize(code_generator: Codebreaker::NumbersGenerator, attempts: 10)
			@attempts = attempts
			@code_generator = code_generator
		end
		
		def secret_code
			raw = code_generator.generate
			Codebreaker::SecretCode.parse(raw)
		end
	end
end