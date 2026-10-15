module Codebreaker
  class Console
    def initialize(input:, output:)
      @input = input
      @output = output
    end

    def puts(text) = @output.puts(text)
    def gets = @input.gets
  end
end
