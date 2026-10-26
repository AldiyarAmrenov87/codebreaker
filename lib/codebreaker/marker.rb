module Codebreaker
  class Marker
    attr_reader :exact_match_count, :number_match_count

    def self.evaluate(secret_code:, guess:)
      @@secret_code_value = secret_code.value.dup
      @@guess_value = guess.value
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
          @@secret_code_value.sub!(@@guess_value[index], " ")
          count + 1
        else
          count + 0
        end
      end
    end

    def self.exact_match?(index)
      @@guess_value[index] == @@secret_code_value[index]
    end

    def self.number_match?(index)
      !exact_match?(index) && @@secret_code_value.include?(@@guess_value[index])
    end
  end
end