Feature: testing prime factors program

    Scenario:
        Given I am computing the prime factors
        When I input 3
        Then I get back "3"

    Scenario:
        Given I am computing prime factors
        When I input 8
        Then I get back "2,2,2"

    Scenario:
        Given I am computing prime factors
        When I input 901255
        Then I get back "5,17,23,461"
