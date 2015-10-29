Feature: Google Search
  The Google homepage allows user to perform a search.

  Scenario Outline: Users can perform a search on Google
    Given I open the Google search page
    When I search for "<search>"
    Then I should see the results page

  Examples:
  | search        |
  | fig rolls     |
  | giants        |
  | san francisco |