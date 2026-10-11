Given('I am not yet playing') do
end

When('I start a new game') do
  allow(fake_input).to receive(:gets).and_return("1234\n")
  allow(Codebreaker::Marker).to receive(:mark).and_return("++++")
  app.start
end

Then('I should see {string}') do |expected_string|
  all_text = fake_output.string
  
  expect(all_text).to include(expected_string)
end

Given('The secret code is {string}') do |secret|
  allow(app).to receive(:generate_secret).and_return(secret)
end

When('I guess {string}') do |guess|
  fake_input.puts("#{guess}\n")
  fake_input.rewind
  def app.loop
    yield # yield просто выполнит код внутри loop { ... } один раз и выйдет
  end
  app.start
end

When('I successively enter the following guesses:') do |table|
  guesses = table.raw.flatten
  inputs = guesses.map { |guess| "#{guess}\n" }
  allow(fake_input).to receive(:gets).and_return(*inputs)
  app.start
end

Then('I should see the markings in the following order:') do |table|
  expected_marks = table.raw.flatten
  all_text = fake_output.string
  expected_marks.each do |mark|
    expect(all_text).to include(mark)
  end
end