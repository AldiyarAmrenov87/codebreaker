module Codebreaker
	describe Messages do
		
		describe '.welcome' do
			it 'returns welcome message' do
				expect(described_class.welcome).to eq("Welcome to Codebreaker!\nEnter guess:")
			end
		end

		describe '.prompt' do
			it 'returns prompt text with remaining attempts count' do
				attempts_left = 5
				expect(described_class.prompt(attempts_left)).to eq('5 attempts left')
			end
		end

		describe '.marker' do
			it 'converts marker to string' do
	      		# Создаем двойника для Marker и настраиваем его метод #to_s
	      		marker = instance_double('Codebreaker::Marker', to_s: '++--')

	      		expect(described_class.mark(marker)).to eq('++--')
	    	end
		end

		describe '.error' do
		    it 'returns formatted error message' do
		      error_code = :invalid_length

		      expect(described_class.error(error_code)).to eq("Error: You need to enter exactly 4 digits. Attempt not counted.")
		    end
	  	end

		describe '.result' do
			# Задаем базового двойника для сессии (игры)
    		let(:session) { instance_double('Codebreaker::Session') }

			context "when the session is lost" do
				let(:secret_double) { instance_double('Codebreaker::SecretCode', to_s: '1234') }

				before do
					allow(session).to receive(:won?).and_return(false)
    				allow(session).to receive(:lost?).and_return(true)
    				allow(session).to receive(:secret_code).and_return(secret_double)
				end

				it 'returns losing message with revealed secret code' do
			    expect(described_class.result(session)).to eq("You lose! The secret code is 1234")
			  end
			end

			context "when the game is won" do
				before do
					allow(session).to receive(:won?).and_return(true)
    				allow(session).to receive(:lost?).and_return(false)
				end

				it 'returns winning message' do
			    	expect(described_class.result(session)).to eq("Congratulations! You won!")
			  	end
			end

			context 'when the game is still in progress' do
	      		before do
	        		allow(session).to receive(:won?).and_return(false)
	        		allow(session).to receive(:lost?).and_return(false)
	      		end

	      		it 'returns nil' do
	        		expect(described_class.result(session)).to be_nil
	      		end
	    	end
		end
	end
end