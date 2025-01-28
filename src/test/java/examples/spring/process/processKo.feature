@Spring @Process @Robustness
Feature: Process file - ko tests

  Background:
    * url springUrl
    * def userData = {email: 'test-front@test.com', password: 'haslo123'}
    * def responseToken = call read('../auth/loginStep.feature') userData
    * def token = "Bearer " + responseToken.response
    * def authToken = { "Authorization": "#(token)" }
    * def file =
      """
      {
        "filePath": "Test.pdf",
        "filename": "Test.pdf",
        "contentType": "multipart/form-data"
      }
      """

  @InvalidPath
  Scenario: Invalid path
    Given path 'processXXX'
    And headers authToken
    And multipart file file = file
    When method POST
    Then status 404

  @InvalidMethod
  Scenario: Invalid method
    Given path 'process'
    And headers authToken
    And multipart file file = file
    When method PUT
    Then status 405

  @InvalidFilePath
  Scenario Outline: Invalid filePath: <filePath>
    Given path 'process'
    And headers authToken
    And file.filePath = <filePath>
    And multipart file file = file
    When method POST
    Then status 403

    Examples:
      | filePath |
      | 'XXX'    |
      | ''       |
      | null     |

  @InvalidFilename
  Scenario Outline: Invalid filename: <filename>
    Given path 'process'
    And headers authToken
    And file.filename = <filename>
    And multipart file file = file
    When method POST
    Then status 403

    Examples:
      | filename |
      | 'XXX'    |
      | ''       |
      | null     |

  @InvalidContentType
  Scenario Outline: Invalid contentType: <contentType>
    Given path 'process'
    And headers authToken
    And file.contentType = <contentType>
    And multipart file file = file
    When method POST
    Then status 403

    Examples:
      | contentType |
      | 'XXX'       |
      | ''          |
      | null        |
