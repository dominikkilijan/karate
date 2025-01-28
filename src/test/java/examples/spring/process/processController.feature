@Spring @Process @ProcessController
Feature: Process Controller

  @LoggedInFileUpload
  Scenario: File upload by logged user
    * def userData = { email: 'test-front@test.com', password: 'haslo123' }
    * def responseToken = call read('../auth/loginStep.feature') userData
    * def token = "Bearer " + responseToken.response
    * def requestData =
    """
    {
      "Authorization": "#(token)",
      "filePath": "Test.pdf",
      "filename": "Test.pdf",
      "contentType": "multipart/form-data"
    }
    """
    * call read('processStep.feature') requestData

  @LoggedOutFileUpload
  Scenario: File upload by unlogged user
    * def requestData =
    """
    {
      "Authorization": null,
      "filePath": "Test.pdf",
      "filename": "Test.pdf",
      "contentType": "multipart/form-data"
    }
    """
    * call read('processStep.feature') requestData


