RSpec.describe Codebreaker::SecretCoder do
  subject(:secret_coder) { described_class.new(number_length: number_length, max_digit: max_digit) }
  let(:number_length) { 4 }
  let(:max_digit) { 5 }

  describe '#secret_code' do
    context 'when the format is followed' do
      context 'when the format is totally followed' do
        it 'returns an instance of SecretCode with value' do
          returned_result = secret_coder.secret_code('0125')
          expect(returned_result).to be_an_instance_of(Codebreaker::SecretCode)
          expect(returned_result.value).to eq('0125')
        end
      end
      
      context 'when there are extra spaces at the edges' do
        it 'it cleans value from extra spaces' do
          returned_result = secret_coder.secret_code('   0125   ')
          expect(returned_result.value).to eq('0125')
        end
      end
    end

    context 'when the format is not followed' do
      context 'when the length is shorter' do
        it 'raises error' do
          expect { secret_coder.secret_code('012') }
            .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the length is greater' do 
        it 'raises error' do
          expect { secret_coder.secret_code('01251') }
            .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the digit is out of range' do
        it 'raises error' do
          expect { secret_coder.secret_code('0126') }
            .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when there are letters' do
        it 'raises error' do
          expect { secret_coder.secret_code('01ab') }
            .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end

      context 'when the raw guess is empty or nil' do
        it 'raises error' do
          expect { secret_coder.secret_code('') }
            .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:invalid_format)
          end

          expect { secret_coder.secret_code(nil) }
            .to raise_error(Codebreaker::InvalidSecretCode) do |error|
            expect(error.code).to eq(:invalid_format)
          end
        end
      end
    end
  end
end