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
			mark = ''
      secret = @secret_code.dup #без метода dup здесь было бы запись адреса на значение, а не значения. С dup же присваивается новый объект. 

      guess.each_char.with_index do |char, index| 
      	if secret[index] == char
      		mark << '+'
          	guess[index] = secret[index] = ' '
          end 
     	end

    	secret.delete!(' ')
    	guess.delete!(' ')
      
    	guess.each_char do |char|
      	if secret.include?(char)
          	mark << '-'
          	secret.sub!(char, "")
          end
    	end

    	return mark
		end

		def generate_secret
			options = %w[1 2 3 4 5 6]
			(1..4).map { options.delete_at(rand(options.length))}.join
		end
	end
end
