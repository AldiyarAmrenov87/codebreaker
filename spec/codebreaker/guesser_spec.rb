RSpec.describe Codebreaker::Guesser do
  subject(:guesser) { described_class.new(number_length, max_digit) }

  let(:number_length) { 4 }
  let(:max_digit) { 5 }

  describe '#guess' do
    context 'when the format is followed' do
      context 'when the format is totally followed' do
        it 'it returns an instance of Guess' do
          returned_result = described_class.guess('0125')
          expect(returned_result).to be_an_instance_of(Guess)
        end
      end
      context 'when there are extra spaces at the edges' do
        it 'it returns an instance of Guess' do
          returned_result = described_class.guess('   0125   ')
          expect(returned_result).to be_an_instance_of(Guess)
        end
      end
    end

    context 'when the format is not followed' do
      context 'when the length is shorter'
        it 'raises error' do
          expect { described_class.guess('012') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the length is greater'
        it 'raises error' do
          expect { described_class.guess('01251') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the digit is out of range'
        it 'raises error' do
          expect { described_class.guess('0126') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when there are letters'
        it 'raises error' do
          expect { described_class.guess('01ab') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the raw guess is empty or nil'
        it 'raises error' do
          expect { described_class.guess('') }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:guess_invalid_format)
          end

          expect { described_class.guess(nil) }
            .to raise_error(Codebreaker::InvalidGuess) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end
    end
  end
end