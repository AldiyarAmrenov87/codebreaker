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
      result = 0
      guess.each_char.with_index do |char, index| 
        result += 1 if @secret_code[index] == char
      end
      return result
    end

    def number_match_count(guess)
      secret = @secret_code.dup
      result = 0
      guess.each_char.with_index do |char, index|
        if secret[index] != char && secret.include?(char)
          secret.sub!(char, " ")
          result += 1
        end
      end
      return result
    end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end
	end
end
