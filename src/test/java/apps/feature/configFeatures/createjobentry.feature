Feature: Create job entry in the application
  Use Post request to create job entry to create job entries in the portal

  Background: Set base url and payload
    Given url _url

  Scenario: Create Job entry in the application - read json payload
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    And def requestPayload = read ('../../data/jsonPayload/jobportaldata.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
    * print response
    And match response.jobTitle == 'Software Engg - 101'
    And match response.jobId == 101