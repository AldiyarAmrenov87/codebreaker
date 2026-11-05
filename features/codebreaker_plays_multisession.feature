Feature: Codebreaker plays multisession
	
	As a Codebreaker
	I want to play several games in a row at my own discretion
	So that i can to try to improve my progress

		Scenario: multisession

			Given The secret codes are "1234, 4321"
			And The game has "10, 1" attempts for sessions respectively
			When I guess "1235"
			And I guess "1234"
			And I type "y"
			And I guess "1324"
			And I type "n"
			
			And I act out the scenario
			
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