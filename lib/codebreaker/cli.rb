module Codebreaker
	class CLI
		def initialize(input:, output:)
			@console = Console.new(input: input, output: output)
		end

		def run
			game = Game.new(console: @console)
			game.start
		end
	end
end
