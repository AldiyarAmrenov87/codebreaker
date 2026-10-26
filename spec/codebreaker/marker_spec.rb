module Codebreaker
  describe Marker do
    describe ".evaluate" do
      let(:secret_code) { instance_double('Codebreaker::SecretCode', value: '1234') }
      context "with no matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5555') }
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(0)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(0)
        end
      end

      context "with 1 number match" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '2555') }
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(0)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(1)
        end
      end

      context "with 1 exact match" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '1555') }
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(1)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(0)
        end
      end

      context "with 2 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '2355') }
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(0)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(2)
        end
      end

      context "with 2 exact matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5254') }
        it "returns exact match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(2)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(0)
        end
      end

      context "with 2 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '2545') }
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(0)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(2)
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '2535') }
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(1)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(1)
        end
      end

      context "with 1 exact match and 1 number match (in that order)" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5154') }
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(1)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(1)
        end
      end

      context "with 3 exact matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5234') }
        it "returns exact match count with 3" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(3)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(0)
        end
      end

      context "with 2 exact matches and 1 number match" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5134') }
        it "returns exact match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(2)
        end
        it "returns number match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(1)
        end
      end

      context "with 1 exact match and 2 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5124') }
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(1)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(2)
        end
      end

      context "with 3 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '5123') }
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(0)
        end
        it "returns number match count with 3" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(3)
        end
      end

      context "with 4 exact matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '1234') }
        it "returns exact match count with 4" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(4)
        end
        it "returns number match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(0)
        end
      end

      context "with 2 exact matches and 2 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '1243') }
        it "returns exact match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(2)
        end
        it "returns number match count with 2" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(2)
        end
      end

      context "with 1 exact matches and 3 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '1423') }
        it "returns exact match count with 1" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(1)
        end
        it "returns number match count with 3" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(3)
        end
      end

      context "with 4 number matches" do
        let(:guess) { instance_double('Codebreaker::Guess', value: '4321') }
        it "returns exact match count with 0" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).exact_match_count).to eq(0)
        end
        it "returns number match count with 4" do
          expect(Marker.evaluate(secret_code: secret_code, guess: guess).number_match_count).to eq(4)
        end
      end
    end
  end
end
