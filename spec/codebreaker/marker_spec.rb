module Codebreaker
  describe Marker do
    describe ".evaluate" do
      let(:secret_code_value) { '1234' }
      context "with no matches" do
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5555').exact_match_count).to eq(0)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5555').number_match_count).to eq(0)
        end
      end

      context "with 1 number match" do
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2555').exact_match_count).to eq(0)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2555').number_match_count).to eq(1)
        end
      end

      context "with 1 exact match" do
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1555').exact_match_count).to eq(1)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1555').number_match_count).to eq(0)
        end
      end

      context "with 2 number matches" do
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2355').exact_match_count).to eq(0)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2355').number_match_count).to eq(2)
        end
      end

      context "with 2 exact matches" do
        it "returns exact match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5254').exact_match_count).to eq(2)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5254').number_match_count).to eq(0)
        end
      end

      context "with 2 number matches" do
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2545').exact_match_count).to eq(0)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2545').number_match_count).to eq(2)
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2535').exact_match_count).to eq(1)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '2535').number_match_count).to eq(1)
        end
      end

      context "with 1 exact match and 1 number match (in that order)" do
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5154').exact_match_count).to eq(1)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5154').number_match_count).to eq(1)
        end
      end

      context "with 3 exact matches" do
        it "returns exact match count with 3" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5234').exact_match_count).to eq(3)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5234').number_match_count).to eq(0)
        end
      end

      context "with 2 exact matches and 1 number match" do
        it "returns exact match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5134').exact_match_count).to eq(2)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5134').number_match_count).to eq(1)
        end
      end

      context "with 1 exact match and 2 number matches" do
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5124').exact_match_count).to eq(1)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5124').number_match_count).to eq(2)
        end
      end

      context "with 3 number matches" do
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5123').exact_match_count).to eq(0)
        end
        it "returns number match count with 3" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '5123').number_match_count).to eq(3)
        end
      end

      context "with 4 exact matches" do
        it "returns exact match count with 4" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1234').exact_match_count).to eq(4)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1234').number_match_count).to eq(0)
        end
      end

      context "with 2 exact matches and 2 number matches" do
        it "returns exact match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1243').exact_match_count).to eq(2)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1243').number_match_count).to eq(2)
        end
      end

      context "with 1 exact matches and 3 number matches" do
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1423').exact_match_count).to eq(1)
        end
        it "returns number match count with 3" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '1423').number_match_count).to eq(3)
        end
      end

      context "with 4 number matches" do
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '4321').exact_match_count).to eq(0)
        end
        it "returns number match count with 4" do
          expect(Marker.evaluate(secret_code_value: secret_code_value, guess_value: '4321').number_match_count).to eq(4)
        end
      end
    end
  end
end
