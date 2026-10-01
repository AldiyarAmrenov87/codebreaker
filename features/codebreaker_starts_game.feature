Feature:

      As a Codebreaker
      I want to start a game
      So that i can break the code

      General scenario:

            Given I'm not yet playing
            When I start a new game
            Then I should see welcome message 
            And I should see prompt to enter a guess

            Scenario: start game

                  Given I am not yet playing
                  When I start a new game
                  Then I should see "Welcome to Codebreaker!"
                  And I should see "Enter guess:"

