Given('I am not yet playing') do
end

Given("{string} attempts to guess the secret code") do |string|
  @attempts = string.to_i
end

Given('The secret code is {string}') do |secret|
  secret_code_instance = Codebreaker::SecretCode.new(secret)
  
  allow(Codebreaker::SecretCode).to receive(:generate).and_return(secret_code_instance)
end

Given('The secret codes are {string}') do |secret_codes_string|
  secret_code_instances = secret_codes_string.split(',').map do |secret|
    Codebreaker::SecretCode.new(secret.strip)
  end
  
  allow(Codebreaker::SecretCode).to receive(:generate).and_return(*secret_code_instances)
end

Given('The game has {string} attempts for sessions respectively') do |attempts_string|
  attempts_array = attempts_string.split(',').map { |a| a.strip.to_i }

  allow_any_instance_of(Codebreaker::Game).to receive(:attempts).and_return(*attempts_array)
end

When('I start a new game') do
  cli.run
end

Then('I should see {string}') do |string|
  all_text = fake_output.string
  
  expect(all_text).to include(string)
end

Then('I should not see {string}') do |unexpected_string|
  all_text = fake_output.string
  
  expect(all_text).not_to include(unexpected_string)
end

Then('I should not see {string}') do |string|
  all_text = fake_output.string
  
  expect(all_text).not_to include(string)
end

When('I guess {string}') do |guess|
  fake_input.puts(guess)
  #fake_input.rewind
  #cli.run
end

When('I type {string}') do |answer|
  fake_input.puts(answer)
end

When('I act out the scenario') do
  fake_input.rewind
  cli.run
end

When('I successively enter the following guesses:') do |table|
  guesses = table.raw.flatten
  inputs = guesses.map { |guess| "#{guess}\n" }
  allow(fake_input).to receive(:gets).and_return(*inputs)
  cli.run
end

Then('I should see the markings in the following order:') do |table|
  expected_marks = table.raw.flatten
  all_text = fake_output.string
  expected_marks.each do |mark|
    expect(all_text).to include(mark)
  end
end


