module Codebreaker
	class Game

		def initialize(input: $stdin, output: $stdout)
			@input = input
			@output = output
		end

		def start
			@output.puts("Welcome to Codebreaker!")
			@output.puts("Enter guess:")
			@secret_code = generate_secret
			result = guess(@input.gets.chomp)
			@output.puts(result)
		end

		def guess(guess)
      exact_match_count = 0
      number_match_count = 0
      secret = @secret_code.dup 

      guess.each_char.with_index do |char, index| 
        if secret[index] == char
          exact_match_count += 1
          guess[index] = secret[index] = ' '
        end 
      end

      secret.delete!(' ')
      guess.delete!(' ')
      
      guess.each_char do |char|
        if secret.include?(char)
          number_match_count += 1
          secret.sub!(char, "")
        end
      end

      mark = '+'*exact_match_count + '-'*number_match_count
      return mark
    end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end
	end
end
