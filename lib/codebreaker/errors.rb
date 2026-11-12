module Codebreaker
  class Error < StandardError; end

  class InvalidGuess < Error
    attr_reader :code

    def initialize(code = :guess_invalid_length)
      @code = code
      super("Invalid guess error code: #{code}") # Или просто пустая строка
    end
  end

  class InvalidSecretCode < Error
    attr_reader :code

    def initialize(code = :secret_code_invalid_length)
      @code = code
      super("Invalid secret code error code: #{code}") # Или просто пустая строка
    end
  end
end