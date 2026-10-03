module Codebreaker
  describe Marker do
    describe ".mark" do
      let(:secret_code) { '1234' }
      context "with no matches" do
        it "returns a mark with ''" do
          expect(Marker.mark(secret_code,'5555')).to eq('')
        end
      end

      context "with 1 number match" do
        it "returns a mark with '-'" do
          expect(Marker.mark(secret_code,'2555')).to eq('-')
        end
      end

      context "with 1 exact match" do
        it "returns a mark with '+'" do
          expect(Marker.mark(secret_code, '1555')).to eq('+')
        end
      end

      context "with 2 number matches" do
        it "returns a mark with '--'" do
          expect(Marker.mark(secret_code, '2355')).to eq('--')
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        it "returns a mark with '+-'" do
          expect(Marker.mark(secret_code, '2535')).to eq('+-')
        end
      end
    end
  end
end
