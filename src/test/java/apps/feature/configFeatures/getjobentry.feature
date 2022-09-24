Feature: get apecefic jobportal details based on query parameter - JSON

  Background: set base url and other reusable component
    Given url _url

  Scenario: get job description from jobportal
    * def queryParameters = {id:101,jobTitle:'Software Engg - 101'}
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

  