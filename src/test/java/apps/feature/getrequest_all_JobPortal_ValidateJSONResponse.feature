@Regression
Feature: get jobportal details - JSON

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
    And print jsonResponse[0]
    And match jsonResponse[0].jobTitle == 'Software Engg'
    And match jsonResponse[0].experience[1] == 'Apple'
    And match jsonResponse[0].project[0].projectName == 'Movie App'
    And match jsonResponse[0].project[0].technology[2] == 'Gradle'
    * print jsonResponse[0].project[0].projectName + " " + jsonResponse[0].project[0].technology[2]
    * def myVar = jsonResponse[0].project[0].projectName + " " + jsonResponse[0].project[0].technology[2]
    * print myVar
    * match myVar == 'Movie App Gradle'

  Scenario: get job description from jobportal using wildcard * for json Array
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    * def jsonResponse = response
    And print jsonResponse
    And match jsonResponse[0].experience[*] == ["Google","Apple","Mobile Iron"] #with == order is important
    And match jsonResponse[0].experience[*] contains ['Google','Apple'] # with contains keyword order is not important
    And match jsonResponse[0].experience[*] contains ['Mobile Iron','Apple']
    And match jsonResponse[0].experience[*] contains ['Apple']
    And match jsonResponse[*].jobId contains 1
