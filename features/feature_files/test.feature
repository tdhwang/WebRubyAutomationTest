Feature: Code Automation Test

  @test
  Scenario Outline: Test Automation
    Given a user navigates to the website
    And a user validates elements on page
    And a user validates Image of Day section
    And a user validates On This Day In History section
    And a user searches for <search_criteria>
    And a user validates search page result
    And a user switches to news tab with same result
    Examples:
    | search_criteria  |
    | Google Documents |