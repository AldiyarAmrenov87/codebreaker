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

      context "with 2 exact matches" do
        it "returns a mark with '--'" do
          expect(Marker.mark(secret_code, '2355')).to eq('--')
        end
      end

      context "with 2 exact matches" do
        it "returns a mark with '++'" do
          expect(Marker.mark(secret_code, '5254')).to eq('++')
        end
      end

      context "with 2 number matches" do
        it "returns a mark with '--'" do
          expect(Marker.mark(secret_code, '2545')).to eq('--')
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        it "returns a mark with '+-'" do
          expect(Marker.mark(secret_code, '2535')).to eq('+-')
        end
      end

      context "with 1 exact match and 1 number match (in that order)" do
        it "returns a mark with '+-'" do
          expect(Marker.mark(secret_code, '5154')).to eq('+-')
        end
      end

      context "with 3 exact matches" do
        it "returns a mark with '+++'" do
          expect(Marker.mark(secret_code, '5234')).to eq('+++')
        end
      end

      context "with 2 exact matches and 1 number match" do
        it "returns a mark with '++-'" do
          expect(Marker.mark(secret_code, '5134')).to eq('++-')
        end
      end

      context "with 1 exact match and 2 number matches" do
        it "returns a mark with '+--'" do
          expect(Marker.mark(secret_code, '5124')).to eq('+--')
        end
      end

      context "with 3 number matches" do
        it "returns a mark with '---'" do
          expect(Marker.mark(secret_code, '5123')).to eq('---')
        end
      end

      context "with 4 exact matches" do
        it "returns a mark with '++++'" do
          expect(Marker.mark(secret_code, '1234')).to eq('++++')
        end
      end

      context "with 2 exact matches and 2 number matches" do
        it "returns a mark with '++--'" do
          expect(Marker.mark(secret_code, '1243')).to eq('++--')
        end
      end

      context "with 1 exact matches and 3 number matches" do
        it "returns a mark with '+---'" do
          expect(Marker.mark(secret_code, '1423')).to eq('+---')
        end
      end

      context "with 4 number matches" do
        it "returns a mark with '----'" do
          expect(Marker.mark(secret_code, '4321')).to eq('----')
        end
      end

    end
  end
end
