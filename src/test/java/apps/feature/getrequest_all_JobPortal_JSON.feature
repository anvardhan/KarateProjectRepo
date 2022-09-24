Feature: get jobportal details - JSON

  #Official Document Link:
  #https://github.com/karatelabs/karate
  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: get job description from jobportal
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response
    * def jsonResponse = response
    And print jsonResponse
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * print responseCookies

  Scenario: get job description from jobportal using Background to set base url and use of path and request header
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And match response ==
      """
      [
      {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
          "experience": [
              "Google",
              "Apple",
              "Mobile Iron"
          ],
          "project": [
              {
                  "projectName": "Movie App",
                  "technology": [
                      "Kotlin",
                      "SQL Lite",
                      "Gradle"
                  ]
              }
          ]
      }
      ]
      """

  @Smoke
  Scenario: get job description from jobportal - validate using negate condition
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And print 'jobId--', response[0].jobId
    And match response[0].jobId != 2

  Scenario: get job description from jobportal - validate specefic property
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And match response[0].jobId != 2
    And match response contains deep {"jobDescription": "To develop andriod application"} #deep keyword is used to check for a specefic property in complex nested payload
    And match response contains deep {"project":[{"projectName": "Movie App"}]}

  @Regression
  Scenario: get job description from jobportal - validate headers
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Content-Type contains 'json'
    And match header Connection == 'keep-alive'
