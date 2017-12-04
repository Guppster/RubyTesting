Feature: Examples of beancounting usage

    Scenario Outline:
        Given: Beans <beans>
        When: guesses <guesses> are processed
        Then: rewards are equal to <rewards>

        Examples:
            | beans | guesses | rewards |
