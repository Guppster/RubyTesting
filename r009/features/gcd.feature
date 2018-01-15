Feature: examples of usage of GCD

    Scenario Outline:
        Given that I am calculating GCD
        When I input the numbers <firstNum> and <secondNum>
        Then I get back <output>

        Examples:
            | firstNum | secondNum | output |
            | 1 | 2 | 1 |
            | 6 | 8 | 2 |
            | 100 | 101 | 1 |
            | 12 | 20 | 4 |
            | 12 | 60 | 12 |

