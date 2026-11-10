module Codebreaker
	class Configurator
		attr_reader :attempts
		attr_writer :code_generator
		
		def initialize(code_generator: -> { SecretCode.generate }, attempts: 10)
			@attempts = attempts
			@code_generator = code_generator
		end
		
		def secret_code
			@code_generator.call
		end
	end
end