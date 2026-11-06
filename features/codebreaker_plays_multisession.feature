Feature: Codebreaker plays multisession
	
	As a Codebreaker
	I want to play several games in a row at my own discretion
	So that i can to try to improve my progress

		Scenario: multisession

			Given The secret codes are: "1234, 4321"
			And The game sessions with "10, 1" attempts left
			And The guesses are: "1235, 1234"
			And The answer to continue is "y"
			And The guesses are: "1324"
			And The answer to continue is "n"
			
			When I act out the scenario
			
			Then I should see "Welcome to Codebreaker"
			And I should see "Round #1."
			And I should see "Enter guess (10 attempts left):"

			Then I should see "+++"
			And I should see "Enter guess (9 attempts left):"

			Then I should see "++++"
			And I should see "Congratulations! You won!"
			And I should see "Play again? (y/n):"

			Then I should not see "Welcome to Codebreaker"
			And I should see "Round #2"
			And I should see "Enter guess (1 attempts left):"

			Then I should see "You lose! The secret code is 4321"
			And I should see "Play again? (y/n):"

			Then I should see "Game over"