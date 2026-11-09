Given('I am not yet playing') do
end

Given('The secret codes are: {string}') do |secret_codes_string|
  secret_code_instances = secret_codes_string.split(',').map do |secret|
    Codebreaker::SecretCode.new(secret.strip)
  end

  allow(configurator).to receive(:secret_code).and_return(*secret_code_instances)
end

Given("The guesses are: {string}") do |guesses_string|
  guesses = guesses_string.split(',').map(&:strip)
  
  guesses.each do |guess|
    fake_input.puts(guess)
  end
end

Given("The game sessions with {string} attempts left") do |attempts_string|
  attempts_array = attempts_string.split(',').map { |a| a.strip.to_i }
  
  allow(configurator).to receive(:attempts).and_return(*attempts_array)
end

Given('The answer to continue is {string}') do |answer|
  fake_input.puts(answer)
end

When('I act out the scenario') do
  fake_input.rewind
  cli.run
end

Then('I should see {string}') do |string|
  expect(fresh_output).to include(string)

  consume_output_up_to!(string)
end

Then('I should not see {string}') do |unexpected_string|
  expect(fresh_output).not_to include(unexpected_string)
end

Then(/^I should see match pattern \/(.+)\/$/) do |pattern_string|
  regex = Regexp.new(pattern_string)

  expect(fresh_output).to match(regex)
  
  match_data = fresh_output.match(regex)
  expect(match_data).not_to be_nil, "Expected text to match /#{pattern_string}/, but it didn't."
  puts "Найдена строка: #{match_data}"
  consume_output_up_to!(match_data.to_s)
end

