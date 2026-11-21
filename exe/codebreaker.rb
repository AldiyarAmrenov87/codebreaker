require 'codebreaker'

Codebreaker::CLI.new(
  input:  $stdin,
  output: $stdout,
  configurator: Codebreaker::Configurator.new(attempts: 10, number_length: 4, max_digit: 5)
).run