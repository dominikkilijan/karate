@Spring @Login @LoginController
Feature: Login controller

  Scenario: Login valid user
    * def userData = {email: 'test-front@test.com', password: 'haslo123'}
    * call read('accountStep.feature') userData