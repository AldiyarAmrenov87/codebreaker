RSpec.describe Codebreaker::Guess do
  describe '.parse' do
    context 'когда переданы ровно 4 цифры' do
      it 'успешно создает объект Guess' do
        guess = described_class.parse('1234')
        expect(guess.value).to eq('1234')
      end

      it 'удаляет лишние пробелы по краям' do
        guess = described_class.parse('  5678  ')
        expect(guess.value).to eq('5678')
      end
    end

    context 'когда формат неверный' do
      it 'вызывает ошибку, если цифр меньше 4' do
        expect { described_class.parse('123') }.to raise_error(Codebreaker::InvalidGuess, 'You need to enter exactly 4 digits.')
      end

      it 'вызывает ошибку, если цифр больше 4' do
        expect { described_class.parse('12345') }.to raise_error(Codebreaker::InvalidGuess, 'You need to enter exactly 4 digits.')
      end

      it 'вызывает ошибку, если введены буквы вместо цифр' do
        expect { described_class.parse('12ab') }.to raise_error(Codebreaker::InvalidGuess, 'You need to enter exactly 4 digits.')
      end

      it 'вызывает ошибку при пустой строке или nil' do
        expect { described_class.parse('') }.to raise_error(Codebreaker::InvalidGuess, 'You need to enter exactly 4 digits.')
        expect { described_class.parse(nil) }.to raise_error(Codebreaker::InvalidGuess, 'You need to enter exactly 4 digits.')
      end
    end
  end
end