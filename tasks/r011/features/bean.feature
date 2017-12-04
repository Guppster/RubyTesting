Feature: Examples of beancounting usage

    Scenario Outline:
        Given: Beans <beans>
        When: users <users> guess <guesses>
        Then: user <user> gets <reward>

        Examples:
            | beans | users | guesses | user | reward |
