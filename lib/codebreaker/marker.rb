module Codebreaker
  class Marker
    attr_reader :exact_match_count, :number_match_count

    def self.evaluate(secret_code_value:, guess_value:)
      @@secret_code = secret_code_value.dup
      @@guess = guess_value
      new(self.exact_match_count, self.number_match_count)
    end

    def initialize(exact_match_count, number_match_count)
      @exact_match_count = exact_match_count
      @number_match_count = number_match_count
    end

    def to_s
      '+'*exact_match_count + '-'*number_match_count
    end

    private

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