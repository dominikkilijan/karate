@AccountStep
Feature: Account - ok step

  Scenario: Get user account files step
    * def feeder = __arg
    * def token = "Bearer " + feeder.response
    * def authToken =
      """
      {
        "Authorization": "#(token)"
      }
      """
    Given url springUrl + 'account'
    And headers authToken
    When method get
    Then status 200
