module Codebreaker
	describe Session do
		subject(:session) { described_class.new(secret_code: secret_code, attempts: attempts) }

		let(:secret_code) { Codebreaker::SecretCode.new('1234') }
		let(:attempts) { 10 }
		
		describe '#initialize' do
			it "exposes the secret code" do
				expect(session.secret_code).to be(secret_code)
			end

			it "starts in playing state" do
				expect(session).to be_playing
				expect(session).not_to be_won
				expect(session).not_to be_lost
			end

			it "starts with full attempts" do
				expect(session.attempts).to eq(attempts)
			end

			it "starts with empty history" do
				expect(session.history).to be_empty
			end

			context 'with custom attempts' do
				let(:attempts) { 3 }

				it 'uses the custom value' do
					expect(session.attempts).to eq(3)
				end
			end
		end

		describe "#guess" do
			let(:guess) {Codebreaker::Guess.new('1235')}
			let(:marker) { session.guess(guess) }

			it 'returns a Marker' do
				expect(marker).to be_a(Codebreaker::Marker)
			end

			it 'decrements attempts by 1' do
				expect { marker }.to change { session.attempts }.by(-1)
			end

			it 'appends an attempt to history' do
				expect { marker }.to change { session.history.size }.by(1)
			end

			it 'stores the guess and the marker in the attempt' do
				marker
				attempt = session.history.last

				expect(attempt.guess).to be_a(Codebreaker::Guess)
				expect(attempt.guess.value).to 	eq('1235')
				expect(attempt.marker).to eq(marker)
			end

			it 'uses Marker to evaluate the attempt' do
				expect(marker.exact_match_count).to eq(3)
				expect(marker.number_match_count).to eq(0)
			end

			it 'preserves the order of attempts in history' do
				guess_1 = Codebreaker::Guess.new('1111')
				guess_2 = Codebreaker::Guess.new('2222')
				guess_3 = Codebreaker::Guess.new('3333')

				session.guess(guess_1)
				session.guess(guess_2)
				session.guess(guess_3)

				guesses = session.history.map { |attempt| attempt.guess }
				expect(guesses).to eq([guess_1, guess_2, guess_3])
			end
		end

		describe "state transitions" do
			context 'when the guess matches the secret when attempt is more than 1' do
				before { session.guess(Codebreaker::Guess.new('1234')) }

				it 'is won' do
					expect(session).to be_won
				end

				it 'is no longer playing' do
					expect(session).not_to be_playing
				end
			end

			context 'when the guess does not match and attempts remain' do
				before { session.guess(Codebreaker::Guess.new('5678')) }

				it 'remains playing' do
					expect(session).to be_playing
				end
			end

			context 'when the guess does not match and it was the last attempt' do
				let(:attempts) { 1 }

				before { session.guess(Codebreaker::Guess.new('5678')) }

				it 'is lost' do 
					expect(session).to be_lost
				end

				it 'is no longer playing' do
					expect(session).not_to be_playing
				end
			end

			context 'when the correct guess happens on the last attempt' do
				let(:attempts) { 1 }

				before { session.guess(Codebreaker::Guess.new('1234')) }

				it 'is won, not lost(win take priority)' do 
					expect(session).to be_won
					expect(session).not_to be_lost
				end
			end

			context 'when attempts run out gradually' do
				let(:attempts) { 3 }

				it 'stays playing until the last attempt, the becomes lost' do
					session.guess(Codebreaker::Guess.new('0001'))
					expect(session).to be_playing

					session.guess(Codebreaker::Guess.new('0002'))
					expect(session).to be_playing

					session.guess(Codebreaker::Guess.new('0003'))
					expect(session).to be_lost
				end
			end
		end
	end
end
