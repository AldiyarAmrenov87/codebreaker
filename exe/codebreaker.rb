require 'codebreaker'

Codebreaker::CLI.new(
  input:  $stdin, 
  output: $stdout, 
  code_generator: Codebreaker::CodeGenerator.new(number_length: 4, max_digit: 5), 
  attempts: 10
).run