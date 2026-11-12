RSpec.describe Codebreaker::SecretCode do
  describe '.parse' do
    context 'когда переданы ровно 4 цифры' do
      it 'успешно создает объект SecretCode' do
        secret_code = described_class.parse('1234')
        expect(secret_code.value).to eq('1234')
      end

      it 'удаляет лишние пробелы по краям' do
        secret_code = described_class.parse('  1234  ')
        expect(secret_code.value).to eq('1234')
      end
    end

    context 'когда формат неверный' do
      it 'вызывает ошибку, если цифр меньше 4' do
        expect { described_class.parse('123') }
          .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:secret_code_invalid_length)
          end
      end

      it 'вызывает ошибку, если цифр больше 4' do
        expect { described_class.parse('12345') }
          .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:secret_code_invalid_length)
          end
      end

      it 'вызывает ошибку, если введены буквы вместо цифр' do
        expect { described_class.parse('12ab') }
          .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:secret_code_invalid_length)
          end
      end

      it 'вызывает ошибку при пустой строке или nil' do
        expect { described_class.parse('') }
          .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:secret_code_invalid_length)
          end

        expect { described_class.parse(nil) }
          .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:secret_code_invalid_length)
          end
      end
    end
  end
end
