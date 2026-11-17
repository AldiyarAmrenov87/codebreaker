require 'stringio'

module Codebreaker
  describe Match do
    let(:input) { StringIO.new("1235\n1234\n") }
    let(:output) { StringIO.new }
    let(:console) { Console.new(input: input, output: output) }

    subject(:match) do
      described_class.new(
        console: console, 
        match_number: 1, 
        secret_code: Codebreaker::SecretCode.new('1234'), 
        attempts: 2)
    end

    it "starts unfinished" do
      expect(match).not_to be_won
      expect(match).not_to be_lost
    end

    describe '#play' do
      it "becomes finished after play" do 
        match.play
        expect(match).to be_won.or be_lost
      end

      it "becomes won on correct guess" do 
        match.play
        expect(match).to be_won
      end

      context "when match is lost" do
        let(:input) { StringIO.new("1235\n1235\n") }
        it "becomes lost" do 
          match.play
          expect(match).to be_lost
        end
      end

      it 'stores instance of Session with won or lost status' do
        match.play
        expect(match.session).to be_an_instance_of(Session)
        expect(match.session).to be_won.or(be_lost)
      end

      it "does not change the value of the variable for the number of attempts" do
        expect { match.play }.not_to change(match, :attempts)
      end
    end
  end
end