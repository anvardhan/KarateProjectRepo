Feature: get apecefic jobportal details based on query parameter - JSON

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: get job description from jobportal
    #Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/find'
    * def queryParameters = {id:7777,jobTitle:'SDET'}
    And path '/normal/webapi/find'
    And params queryParameters
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

  Scenario: get job description from jobportal
    #Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/find'
    * def queryParameters = {id:1,jobTitle:'Software Engg'}
    And path '/normal/webapi/find'
    And params queryParameters
    And header accept = 'application/json'
    When method get
    Then status 404
    And print response
    * def jsonResponse = response
    And print jsonResponse
    * match response.message contains 'Failed to find job'
