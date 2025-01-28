@RegisterStep
Feature: Register user - ok step

  Scenario: Create a correct user
    * def feeder = __arg
    * def userData =
    """
    {
      "email": "#(feeder.email)",
      "password": "#(feeder.password)"
    }
    """
    Given url springUrl + 'register'
    And request userData
    When method post
    Then status 201
    And match response == {"id":"#uuid","email":"#(email)","musicFiles":null}