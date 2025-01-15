@Spring @RegisterUser @Robustness
Feature: Register user - ko tests

  Background:
    * url springUrl
    * def dataFaker = Java.type('examples.utils.RandomDataGenerator')
    * def email = dataFaker.getRandomEmail()
    * def userData = {email: '#(email)', password: 'haslo123'}

  @InvalidPath
  Scenario: Invalid path
    Given path 'registerXXX'
    And request userData
    When method POST
    Then status 403

  @InvalidMethod
  Scenario: Invalid method
    Given path 'register'
    And request userData
    When method PUT
    Then status 403

  @InvalidEmail
  Scenario Outline: Invalid email: <email>
    Given path 'register'
    And userData.email = <email>
    And request userData
    When method POST
    Then status 403

    Examples:
      | email |
      | 'XXX' |
      | ''    |
      | null  |

  @InvalidPassord
  Scenario Outline: Invalid password: <password>
    Given path 'register'
    And userData.password = <password>
    And request userData
    When method POST
    Then status 403

    Examples:
      | password |
      | ''       |
      | null     |

  @DupliacatedEmail
  Scenario: Register user with used email
    * call read('registerUserStep.feature') userData
    Given path 'register'
    And request userData
    When method POST
    Then status 403
