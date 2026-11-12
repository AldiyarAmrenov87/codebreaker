Feature: Codebreaker loses game
  		
	As a Codebreaker
	I want to have a limited number of attempts to guess the secret code
	So that the game presents a real challenge and ends with a defeat message when I run out of tries

	General scenario: Attempt counter decreases

		Given A game with a limited number of attempts to enter a guess
		When I submit an incorrect guess
		Then The attempt counter should decrease
		And The game should continue

	General scenario: Losing the game

		Given A game with a limited number of attempts to enter a guess
		When I enter only incorrect guesses
		Then I should see a loss message
		And The game should end

	General scenario: On the last attempt

		Given A game with a final attempt
		When I enter exact guess
		Then I should see the congratulations message
		And The game should end

	Scenario: Attempt counter decreases after an incorrect guess
		Given The game sessions with "5" attempts left
		And The secret codes are: "1234"
		And The guesses are: "2234"
		When I act out the scenario
		Then I should see "Enter guess (4 attempts left):"
		And I should not see "Congratulations! You won!"
		And I should not see "You lose! The secret code is 1234"

	Scenario: Losing the game when running out of attempts
		Given The game sessions with "3" attempts left
		And The secret codes are: "1234"
		And The guesses are: "5555, 1255, 1235"
		When I act out the scenario
		Then I should see "You lose! The secret code is 1234"

	Scenario: Winning on the last attempt
		Given The game sessions with "1" attempts left
		And The secret codes are: "1234"
		And The guesses are: "1234"
		When I act out the scenario
		Then I should see "Congratulations! You won!"