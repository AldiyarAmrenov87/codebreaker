module Codebreaker
	class Configurator
		attr_reader :attempts
		
		def initialize(code_generator: Codebreaker::SecretCode, attempts: 10)
			@attempts = attempts
			@code_generator = code_generator
		end
		
		def secret_code
			@code_generator.generate
		end
	end
end