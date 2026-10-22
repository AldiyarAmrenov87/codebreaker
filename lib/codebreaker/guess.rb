module Codebreaker
  class Guess
    FORMAT = /\A\d{4}\z/

    def self.parse(raw)
      new(raw.to_s.strip)
    end

    attr_reader :value

    def initialize(value)
      @value = value
      validate!
    end

    private

    def validate!
      return if FORMAT.match?(value)
      raise Codebreaker::InvalidGuess, :invalid_length
    end
  end
end