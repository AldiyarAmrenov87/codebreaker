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
  #allow(app).to receive(:playing?).and_return(true, false, true)
  call_count = 0

  allow(app).to receive(:playing?) do
    call_count += 1
    
    case call_count
    when 1
      # 1-й вызов (вход в while): возвращает реальный статус (:playing -> true)
      app.class.instance_method(:playing?).bind_call(app)
    when 2
      # 2-й вызов (проверка 2-й итерации): принудительный false для выхода
      false
    else
      # 3-й вызов и далее (для шага Then): снова возвращает настоящий статус
      app.class.instance_method(:playing?).bind_call(app)
    end
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

Given('The game has started with {string} attempts') do |string|
  app.instance_variable_set(:@attempts, string.to_i)
end

Then('The remaining attempts count should be {string}') do |string|
  expect(app.attempts).to eq(string.to_i)
end

Then('The game should continue') do
  expect(app).to be_playing #
end

Then('The game should end with won') do
  expect(app).to be_won # Write code here that turns the phrase above into concrete actions
end

Then('The game should end with lost') do
  expect(app).to be_lost # Write code here that turns the phrase above into concrete actions
end

#expect(app).to be_won
#expect(app).to be_lost

#class Game
  # Позволяет получить статус напрямую, если это нужно для логики: game.status
  #attr_reader :status 

#  def initialize
#    @status = :playing # Возможные значения: :playing, :wins, :lost
#  end

  # Лексически более правильно использовать формы глаголов/прилагательных
#  def playing?
#    @status == :playing
#  end

#  def won? # Вместо wins? лучше использовать won? (выиграл), так звучит естественнее
#    @status == :wins
#  end

#  def lost?
#    @status == :lost
#  end
#end