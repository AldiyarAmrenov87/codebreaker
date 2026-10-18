module Codebreaker
	class CLI
		def initialize(input:, output:, attempts: nil)
			@console = Console.new(input: input, output: output)
			@attempts = attempts
		end

		def run
			# собираем опции для игры
			game_options = { console: @console }
      		game_options[:attempts] = @attempts if @attempts
			
			game = Game.new(**game_options)
			game.start
		end
	end
end
