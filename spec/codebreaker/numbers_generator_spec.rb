module Codebreaker
	describe NumbersGenerator do
		describe ".generate" do
			it "returns number with 4 digits" do
				result = described_class.generate

        expect(result).to be_a(String)
        expect(result).to match(/\A[0-5]{4}\z/)
			end
		end
	end
end