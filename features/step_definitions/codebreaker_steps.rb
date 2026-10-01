Given('I am not yet playing') do
end

When('I start a new game') do
  fake_input.puts("1234\n") #передаем догадку натурально - вместе с символом переноса строки, - поскольку #start будет её урезать(chomp)
  fake_input.rewind
  app.start
end

Then('I should see {string}') do |expected_string|
  all_text = fake_output.string
  
  expect(all_text).to include(expected_string)
end

Given('the secret code is {string}') do |secret|
  allow(app).to receive(:generate_secret).and_return(secret)
end

When('I guess {string}') do |guess|
  fake_input.puts("#{guess}\n")
  fake_input.rewind
  app.start
end
