module Codebreaker
  class CodeGenerator
    attr_reader :number_length, :max_digit

    def initialize(number_length:, max_digit:)
      @number_length = number_length
      @max_digit = max_digit
    end

    def generate
      Array.new(@number_length) { rand(0..@max_digit) }.join
    end
  end
end