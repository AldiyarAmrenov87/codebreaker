RSpec.describe Codebreaker::CodeGenerator do
  subject(:code_generator) { described_class.new(number_length: number_length, max_digit: max_digit) }
  let(:number_length) { 4 }
  let(:max_digit) { 5 }

  describe "#generate" do
    it 'returns string' do
      expect(code_generator.generate).to be_an_instance_of(String)
    end

    it 'generates code matching length and max_digit rules' do
      10.times do
        secret_code = code_generator.generate
        expect(secret_code).to match(/\A[0-5]{4}\z/)
      end
    end

    it 'generates different codes across multiple calls' do
      codes = Array.new(10) { code_generator.generate }
      expect(codes.uniq.size).to be > 1
    end
  end
end