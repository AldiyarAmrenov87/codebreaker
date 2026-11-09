module Codebreaker
	class CLI
		def initialize(input:, output:, configurator:)
			@console = Console.new(input: input, output: output)
			@configurator = configurator
		end

		def run
			game_options = { console: @console }
      game_options[:configurator] = @configurator
			
			game = Game.new(**game_options)
			game.start
		end
	end
end