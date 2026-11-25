module Codebreaker
	class CLI
		def initialize(input:, output:, code_generator:, attempts:)
			@console = Console.new(input: input, output: output)
			@code_generator = code_generator
      @attempts = attempts
		end

		def run
			game_options = { 
        console: @console, 
        code_generator: @code_generator, 
        attempts: @attempts
      }
			
			game = Game.new(**game_options)
			game.start
		end
	end
end
