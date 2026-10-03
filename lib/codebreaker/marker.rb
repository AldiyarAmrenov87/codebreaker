module Codebreaker
  class Marker
    def self.mark(secret_code, guess)
      @@secret_code = secret_code.dup
      @@guess = guess
      
      mark = '+'*exact_match_count + '-'*number_match_count
      return mark
    end

    def self.exact_match_count 
      (0..3).inject(0) do |count, index|
        count + (exact_match?(index) ? 1 : 0)
      end
    end

    def self.number_match_count
      (0..3).inject(0) do |count, index|
        if number_match?(index)
          @@secret_code.sub!(@@guess[index], " ")
          count + 1
        else
          count + 0
        end
      end
    end

    def self.exact_match?(index)
      @@guess[index] == @@secret_code[index]
    end

    def self.number_match?(index)
      !exact_match?(index) && @@secret_code.include?(@@guess[index])
    end
  end
end
