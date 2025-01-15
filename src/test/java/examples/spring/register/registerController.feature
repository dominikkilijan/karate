@Spring @RegisterController
Feature: Register controller - ok test

  Scenario: Register valid user
    * def dataFaker = Java.type('examples.utils.RandomDataGenerator')
    * def email = dataFaker.getRandomEmail()
    * def userData = {email: '#(email)', password: 'haslo123'}
    * call read('registerUserStep.feature') userData