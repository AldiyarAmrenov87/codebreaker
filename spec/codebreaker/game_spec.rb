module Codebreaker
  describe Game do
    let(:game) { Game.new(input: @stdin, output: @stdout) }
    describe "#guess" do
      let(:secret_code) { '1234' }
      
      before do
        game.instance_variable_set(:@secret_code, secret_code)
      end

      context "with no matches" do
        it "returns a mark with ''" do
          expect(game.guess('5555')).to eq('')
        end
      end

      context "with 1 number match" do
        it "returns a mark with '-'" do
          expect(game.guess('2555')).to eq('-')
        end
      end

      context "with 1 exact match" do
        it "returns a mark with '+'" do
          expect(game.guess('1555')).to eq('+')
        end
      end

      context "with 2 number matches" do
        it "returns a mark with '--'" do
          expect(game.guess('2355')).to eq('--')
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        it "returns a mark with '+-'" do
          expect(game.guess('2535')).to eq('+-')
        end
      end
    end
  end
end