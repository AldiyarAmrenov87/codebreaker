Feature: Codebreaker plays multisession
	
	As a Codebreaker
	I want to play several games in a row at my own discretion
	So that i can to try to improve my progress

	General scenario: Когда я начинаю игру, то вижу приветственное сообщение

	General scenario: согласие сыграть ещё после любой(победа или поражение) одной сессии(увидеть сообщение о начале 2 раунда)

		Given The secret code
		When I start a game
		Then I should see welcome message
		And I should see the first round message
		And I should see prompt to enter a guess with attempts left message
		When I enter an exact guess
		Then I should see congrat message
		And I should see invitation to play again
		And I should not see game over message
		When I agree
		Then I should not see welcome message
		And I should see the second round message
        And I should see prompt to enter a guess with attempts left message

	General scenario: отказ сыграть ещё после любой одной сессии

		Given The secret code
		When I start a game
		Then I should see welcome message
		And I should see the first round message
		And I should see prompt to enter a guess with attempts left message
		When I enter an exact guess
		Then I should see congrat message
		And I should see invitation to play again
		When I disagree
		Then I should see progress message
		And I should see game over message

	General scenario: согласие сыграть ещё после любых двух сессий подряд(увидеть сообщение о начале 3 раунда)

	General scenario: отказ сыграть ещё после любых двух сессий поряд(увидеть прогресс о двух сыгранных сессиях)

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