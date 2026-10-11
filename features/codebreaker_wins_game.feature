Feature: codebreaker wins the game
	
	As a Codebreaker
	I want to receive a mark for each guess I make
	So that I can guess the secret code and win

			General scenario:

		    Given The secret code
		    When I enter guesses one by one
		    Then I should see the corresponding number of markers
				And I should see a congratulatory message

		    Scenario: Victory after a few incorrect guesses
	        Given The secret code is "1234"
	        When I successively enter the following guesses:
          	| 5555 |
          	| 1255 |
          	| 1234 |
	        Then I should see the markings in the following order:
	          |      |
						| ++   |
						| ++++ |
	        And I should see "Congratulations! You won!"