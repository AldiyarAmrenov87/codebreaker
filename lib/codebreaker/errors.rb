module Codebreaker
  class Error < StandardError; end

  class InvalidGuess < Error
    attr_reader :code

    def initialize(code = :invalid_length)
      @code = code
      super("Invalid guess error code: #{code}") # Или просто пустая строка
    end
  end
end