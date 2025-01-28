@LoginStep
Feature: Login user - ok step

  Scenario: Login user succesfully
    * def feeder = __arg
    * def userData =
      """
      {
        "email": "#(feeder.email)",
        "password": "#(feeder.password)"
      }
      """
    Given url springUrl + 'auth/login'
    And params userData
    When method post
    Then status 200
    And match response == '#string'