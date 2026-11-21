module Codebreaker
  class Error < StandardError
    attr_reader :code

    def initialize(code)
      @code = code
      super("Validation failed for #{object_name}: #{code}")
    end

    def object_name
      # "Codebreaker::InvalidSecretCode" -> "InvalidSecretCode" -> "SecretCode" -> :secret_code
      self.class.name.split('::').last
          .delete_prefix('Invalid')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .downcase
          .to_sym
    end
  end

  class InvalidGuess < Error; end

  class InvalidSecretCode < Error; end
end
