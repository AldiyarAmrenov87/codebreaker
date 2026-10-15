require 'codebreaker'

Codebreaker::CLI.new(
  input:  $stdin,
  output: $stdout
).run