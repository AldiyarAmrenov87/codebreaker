Feature: codebreaker wins the game
	
	As a Codebreaker
	I want to receive a mark for each guess I make
	So that I can guess the secret code and win

			General scenario:

		    	Given The secret code
		    	When I enter guesses one by one, the last of which is exact
		    	Then I should see the corresponding number of markers
				And I should see a congratulatory message

		    	Scenario: Victory after a few incorrect guesses
					Given The secret codes are: "1234"
					And The guesses are: "5555, 1255, 1234"
					When I act out the scenario
					Then I should see ""
					And I should see "++"
					And I should see "++++"
					And I should see "Congratulations! You won!"