RSpec.describe Codebreaker::SecretCode do
  subject(:secret_code) { described_class.new('1234') }

  describe '#matches?' do
    context 'when guess value matches secret code' do
      let(:match_guess) { instance_double(Codebreaker::Guess, value: '1234') }

      it 'returns true' do
        expect(secret_code.matches?(match_guess)).to be true
      end
    end

    context 'when guess value does not match secret code' do
      let(:not_match_guess) { instance_double(Codebreaker::Guess, value: '1235') }

      it 'returns false' do
        expect(secret_code.matches?(not_match_guess)).to be false
      end
    end
  end

  describe '#to_s' do
    it 'returns string representation of the code' do
      expect(secret_code.to_s).to eq('1234')
    end
  end
end
