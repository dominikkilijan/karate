@Spring @Login @Robustness
Feature: login user - ko tests

  Background:
    * url springUrl
    * def userData = {email: 'test-front@test.com', password: 'haslo123'}

  @InvalidPath
  Scenario: Invalid path
    Given path 'auth/loginXXX'
    And params userData
    When method POST
    Then status 403

  @InvalidMethod
  Scenario: Invalid method
    Given path 'auth/login'
    And params userData
    When method PUT
    Then status 403

  @InvalidEmail
  Scenario Outline: Invalid email: <email>
    Given path 'auth/login'
    And userData.email = <email>
    And params userData
    When method POST
    Then status <status>

    Examples:
      | email | status |
      | 'XXX' | 401    |
      | ''    | 401    |
      | null  | 403    |

  @InvalidPassword
  Scenario Outline: Invalid password: <password>
    Given path 'auth/login'
    And userData.password = <password>
    And params userData
    When method POST
    Then status <status>

    Examples:
      | password | status |
      | ''       | 401    |
      | null     | 403    |
