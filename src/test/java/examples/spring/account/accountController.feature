@Spring @Account @AccountController
Feature: Account controller

  Scenario: Get user account files
    * def userData = {email: 'test-front@test.com', password: 'haslo123'}
    * def authToken = call read('../auth/loginStep.feature') userData
    * call read('accountStep.feature') authToken