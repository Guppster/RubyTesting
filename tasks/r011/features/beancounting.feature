Feature: examples of beancounting usage

    Scenario Outline:
        Given Beans <beans>
        When guesses <guesses> are processed
        Then rewards are equal to <rewards>

        Examples:
          | beans | guesses | rewards |
          |"aadddddddddddddddddddddddffffffffffffffffwwwwwwwwwwwwccccalalala"|"A a:6,c:6\nB w:12\nC d:25\nD d:22,c:4,l:3,f:15\n"|"A 3.20\nB 3.20\nD 9.60\n"|
