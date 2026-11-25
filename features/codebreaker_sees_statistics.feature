Feature: Codebreaker sees statistics

  As a Codebreaker
  I want to see the statistics before game over
  So that i can see my progress

    Scenario: Statistics after 5 wins and 3 loses

      Given The secret codes are: "1234, 4321, 3412, 4312, 3421, 4123, 2314, 2134"
      And The guesses are:
        | session | guess |
        | 1       | 0000  |
        | 1       | 0000  |
        | 1       | 1234  |
        | 2       | 0000  |
        | 2       | 0000  |
        | 2       | 0000  |
        | 2       | 0000  |
        | 2       | 4321  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 3       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 4       | 0000  |
        | 5       | 0000  |
        | 5       | 0000  |
        | 5       | 0000  |
        | 5       | 0000  |
        | 5       | 0000  |
        | 5       | 3421  |
        | 6       | 0000  |
        | 6       | 4123  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 7       | 0000  |
        | 8       | 2134  |
      When I act out the scenario
      Then I should see:
        """
        === Campaign summary ===
        Matches: 8
        Won:     5
        Lost:    3
        """