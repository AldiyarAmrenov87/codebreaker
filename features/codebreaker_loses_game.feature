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
		And The should end

	Scenario: Attempt counter decreases after an incorrect guess
		Given The game has started with "5" attempts
		And The secret code is "1234"
		When I guess "2234"
		Then The remaining attempts count should be "4"
		And The game should continue

	Scenario: Losing the game when running out of attempts
		Given The game has started with "3" attempts
		And The secret code is "1234"
		When I successively enter the following guesses:
				| 5555 |
				| 1255 |
				| 1235 |
		Then The remaining attempts count should be "0"
		And I should see "You lose! The secret code is 1234"
		And The game should end with lost

	Scenario: Winning on the last attempt
		Given The game has started with "1" attempts
		And The secret code is "1234"
		When I guess "1234"
		Then The remaining attempts count should be "0"
		And I should see "Congratulations! You won!"
		And The game should end with won