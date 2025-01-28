@Spring1 @Register @RegisterController
Feature: Register controller

  Scenario: Register valid user
    * def dataFaker = Java.type('examples.utils.RandomDataGenerator')
    * def email = dataFaker.getRandomEmail()
    * def userData = {email: '#(email)', password: 'haslo123'}
    * call read('registerStep.feature') userData