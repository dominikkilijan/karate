@Spring @Account @Robustness
Feature: login user - ko tests

  Background:
    * url springUrl
    * def userData = {email: 'test-front@test.com', password: 'haslo123'}
    * def responseToken = call read('../auth/loginStep.feature') userData
    * def token = "Bearer " + responseToken
    * def authToken =
      """
      {
        "Authorization": "#(token)"
      }
      """

  @InvalidPath
  Scenario: Invalid path
    Given path 'accountXXX'
    And headers authToken
    When method get
    Then status 401

  @InvalidMethod
  Scenario: Invalid method
    Given path 'account'
    And headers authToken
    When method get
    Then status 401

  @InvalidToken
  Scenario Outline: Invalid token: <token>
    Given path 'account'
    And authToken.Authorization = <token>
    And headers authToken
    When method get
    Then status 403

    Examples:
      | token |
      | 'XXX' |
      | ''    |
      | null  |
