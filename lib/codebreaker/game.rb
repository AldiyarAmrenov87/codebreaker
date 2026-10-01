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
      exact_match_count = exact_match_count(guess)
      number_match_count = number_match_count(guess)
      
      mark = '+'*exact_match_count + '-'*number_match_count
       return mark
    end

    def exact_match_count(guess) 
      (0..3).inject(0) do |count, index|
        count + (exact_match?(guess, index) ? 1 : 0)
      end
    end

    def number_match_count(guess)
      secret = @secret_code.dup
      (0..3).inject(0) do |count, index|
        if number_match?(guess, index)
          secret.sub!(guess[index], " ")
          count + 1
        else
          count + 0
        end
      end
    end

    def exact_match?(guess, index)
      guess[index] == @secret_code[index]
    end

    def number_match?(guess, index)
      !exact_match?(guess, index) && @secret_code.include?(guess[index])
    end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end
	end
end
