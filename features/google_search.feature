Feature: Google Search
  The Google homepage allows user to perform a search.

  Background:
    Given I have opened google
      When I see the search page

  Scenario Outline: Users can perform a search on Google
    Given I have opened google search I should be able to search for "<search>"
      Then  I should see the results page

  Examples:
  | search     |
  | fig rolls  |
  | lakers     |
  | raptors    |
  | olympics   |
  | selenium   |
  | goblins    |