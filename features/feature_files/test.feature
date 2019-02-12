@test 
Feature: Code Automation Test

  Scenario: Brighter Provider home page navigation
    Given the user navigates to the Brighter website
    And the user selects the provider link on Brighter Home page

  Scenario Outline: Invalid user email login
    Given the user navigates to the Brighter website
    And the user selects the provider link on Brighter Home page
    And the user navigates to the provider login page
    And the user enters false <email> in email form
    And the user enters valid <password> in password form
    And the user select the login button
    And the user receives an error message
    Examples:
    | email        | password     |
    | fake_string  | password     |
    | another_fake | another_pass |
  
  Scenario Outline: Find Your Practice mismatch message
    Given the user navigates to the Brighter website 
    And the user selects the provider link on Brighter Home page
    And the user selects the Sign Up button
    And the user enters a mismatch <phone_number>
    And the user selects the Find My Practice button
    And the user receives mismatch error message
    Examples:
    | phone_number |
    |  1111111111  |
  
  @tcc
  Scenario Outline: Response status code for links
    Given the user goes to Tax Credit Company website
    And the user click on the Solutions tab 
    And the user gets http codes from each <link> in this page
    Examples:
    |                link                  |
    | work-opportunity-tax-credit/         |
    | verification-services/               |
    | research-development-tax-credit/     |
    | sales-use-tax-incentives/            |
    | family-medical-leave-act-tax-credit/ |
    | other-federal-state-tax/             |
    | hurricane-disaster-zone-incentives/  |
    | cost-segregation/                    |
    | green-building-179-d-incentives/     |

  