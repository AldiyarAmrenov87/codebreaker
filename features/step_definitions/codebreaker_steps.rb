Given('I am not yet playing') do
end

When('I start a new game') do
  app.start
end

Then('I should see {string}') do |expected_string|
  all_text = fake_output.string
  
  expect(all_text).to include(expected_string)
end

Given('the secret code is {string}') do |string|
  app.secret_code = string
end

When('I guess {string}') do |string|
  app.guess(guess)
end

Then('I should see mark {string}') do |string|
  all_text = fake_output.string
  
  expect(all_text).to include(expected_string)
end