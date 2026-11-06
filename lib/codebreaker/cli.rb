module Codebreaker
	class CLI
		def initialize(input:, output:, attempts: 10)
			@console = Console.new(input: input, output: output)
			@attempts = attempts
		end

		def run
			# собираем опции для игры
			game_options = { console: @console }
      game_options[:attempts] = @attempts
			
			game = Game.new(**game_options)
			game.start
		end
	end
end
