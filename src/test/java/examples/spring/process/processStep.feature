@ProcessStep
Feature: Process step - ok step

  Scenario: File upload
    * configure readTimeout = 60000
    * def feeder = __arg
    * def authToken = { "Authorization": "#(feeder.Authorization)" }
    * def filePath = feeder.filePath
    * def filename = feeder.filename
    * def contentType = feeder.contentType
    * def file =
    """
    {
      "read": "#(filePath)",
      "filename": "#(filename)",
      "contentType": "#(contentType)"
    }
    """
    Given url springUrl + 'process'
    And headers authToken
    And multipart file file = file
    When method post
    Then status 200