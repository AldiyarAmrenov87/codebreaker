require 'codebreaker'

Codebreaker::CLI.new(
  input:  $stdin,
  output: $stdout,
  configurator: Codebreaker::Configurator.new
).run