Feature: Create job entry in the application
  Use Post request to create job entry to create job entries in the portal

  Background: Set base url and payload
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: Create Job entry in the application - read json payload
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    And def requestPayload = read ('../../data/jsonPayload/jobportaldata.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
    * print response
    And match response.jobTitle == 'Software Engg - 1'
    And match response.jobId == 1

  Scenario: Create Job entry in the application - use payload directly in feature file
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    * def requestPayload =
      """
      {
      "jobId": 2,
      "jobTitle": 'Manager',
      "project": [
      {
      "technology": [
      "SQL Lite",
      "Gradle",
      "Oracle"
      ],
      "projectName": "Movie App"
      }
      ],
      "jobDescription": 'Manager 2',
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ]
      }
      """
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
    * print response
    And match response.jobTitle == 'Manager'
    And match response.jobId == 2
