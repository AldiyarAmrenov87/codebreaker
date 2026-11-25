RSpec.describe Codebreaker::Guesser do
  subject(:guesser) { described_class.new(number_length: number_length, max_digit: max_digit) }
  let(:number_length) { 4 }
  let(:max_digit) { 5 }

  describe '#guess' do
    context 'when the format is followed' do
      context 'when the format is totally followed' do
        it 'returns an instance of Guess' do
          returned_result = guesser.guess('0125')
          expect(returned_result).to be_an_instance_of(Codebreaker::Guess)
        end
      end
      
      context 'when there are extra spaces at the edges' do
        it 'it cleans value from extra spaces' do
          returned_result = guesser.guess('   0125   ')
          expect(returned_result.value).to eq('0125')
        end
      end
    end

    context 'when the format is not followed' do
      context 'when the length is shorter' do
        it 'raises error' do
          expect { guesser.guess('012') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the length is greater' do 
        it 'raises error' do
          expect { guesser.guess('01251') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the digit is out of range' do
        it 'raises error' do
          expect { guesser.guess('0126') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when there are letters' do
        it 'raises error' do
          expect { guesser.guess('01ab') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the raw guess is empty or nil' do
        it 'raises error' do
          expect { guesser.guess('') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end

          expect { guesser.guess(nil) }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end
    end
  end
end