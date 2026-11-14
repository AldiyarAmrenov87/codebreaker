require 'stringio'

module Codebreaker
  describe Match do
    let(:input) { StringIO.new("1234\n") }
    let(:output) { StringIO.new }
    let(:console) { Console.new(input: input, output: output) }

    subject(:match) do
      described_class.new(
        console: console, 
        round: 1, 
        secret_code: '1234', 
        attempts: 1)
    end

    it "starts without session" do
      expect(match.session).to be_nil
    end

    describe '#play' do
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