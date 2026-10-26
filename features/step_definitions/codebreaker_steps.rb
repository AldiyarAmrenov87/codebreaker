Given('I am not yet playing') do
end

When('I start a new game') do
  cli.run
end

Then('I should see {string}') do |string|
  all_text = fake_output.string
  
  expect(all_text).to include(string)
end

Then('I should not see {string}') do |string|
  all_text = fake_output.string
  
  expect(all_text).not_to include(string)
end

Given('The secret code is {string}') do |secret|
  secret_code_instance = Codebreaker::SecretCode.new(secret)
  
  allow(Codebreaker::SecretCode).to receive(:generate).and_return(secret_code_instance)
end

When('I guess {string}') do |guess|
  fake_input.puts("#{guess}\n")
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

Given('The game has started with {string} attempts') do |string|
  @attempts = string.to_i
end
