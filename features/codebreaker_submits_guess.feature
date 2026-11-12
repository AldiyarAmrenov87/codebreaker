Feature: codebreaker_submits_guess

  As a Codebreaker
  I want to submit a guess
  So that I can try to break the code

    General scenario:

      Given The secret code
      When I guess
      Then I should see mark

        Description:

          The code-breaker submits a guess of four numbers.  The game marks the guess with + and - signs.
          For each number in the guess that matches the number and position of a number in the secret code, the mark includes one + sign. For each number in the guess that matches the number but not the position of a number in the secret code, the mark includes one - sign.

      Scenario Outline: submit guess
        Given The secret codes are: "<code>"
        And The guesses are: "<guess>"
        When I act out the scenario
        Then I should see "<mark>"
        
        Scenarios: no matches
          | code | guess | mark |
          | 1234 | 5555  |      |

        Scenarios: 1 number correct
          | code | guess | mark |
          | 1234 | 1555  | +    |
          | 1234 | 2555  | -    |

        Scenarios: 2 numbers correct
          | code | guess | mark |
          | 1234 | 5254  | ++   |
          | 1234 | 5154  | +-   |
          | 1234 | 2545  | --   |

        Scenarios: 3 numbers correct
          | code | guess | mark |
          | 1234 | 5234  | +++  |
          | 1234 | 5134  | ++-  |
          | 1234 | 5124  | +--  |
          | 1234 | 5123  | ---  |

        Scenarios: all numbers correct
          | code | guess | mark |
          | 1234 | 1234  | ++++ |
          | 1234 | 1243  | ++-- |
          | 1234 | 1423  | +--- |
          | 1234 | 4321  | ---- |

      Scenario: submit guesses successively
        Given The secret codes are: "0697"
        And The guesses are: "0679, 6089, 0697"
        When I act out the scenario
        Then I should see "++--"
        And I should see "---"
        And I should see "++++"