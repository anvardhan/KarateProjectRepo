Feature: Basic Auth Example - get jobportal details - JSON

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: Basic Auth Method1 - Example1- Convert username and password to Base 64 encoding and concatenate it with Basic and use it in Authorization
    And path '/secure/webapi/all'
    And header accept = 'application/json'
    And header Authorization = 'Basic YWRtaW46d2VsY29tZQ=='
    When method get
    Then status 200
    And print response
    * def jsonResponse = response
    And print jsonResponse
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * print responseCookies

  Scenario: Basic Auth Method1 - Example2
    And path '/secure/webapi/all'
    #And header accept = 'application/json'
    #And header Authorization = 'Basic YWRtaW46d2VsY29tZQ=='
    * def request_headers = {accept: 'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
    And headers request_headers
    When method get
    Then status 200
    And print 'jobId--', response[0].jobId
    And match response[0].jobId != 2

  Scenario: Basic Auth Method1 - Example3
    And path '/secure/webapi/all'
    #And header accept = 'application/json'
    And configure headers = {accept: 'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response[0].jobId != 2
    And match response contains deep {"jobDescription": "To develop andriod application"} #deep keyword is used to check for a specefic property in complex nested payload
    And match response contains deep {"project":[{"projectName": "Movie App"}]}

  Scenario: Basic Auth Method1 - Example4
    And path '/secure/webapi/all'
    #And header accept = 'application/json'
    And configure headers = {accept: 'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Content-Type contains 'json'
    And match header Connection == 'keep-alive'

  Scenario: Basic Auth Method2 - Example1 - use Reusable JS function from js file-> Assign user name and password at run time which generates basic auth
    And path '/secure/webapi/all'
    And header accept = 'application/json'
    * header Authorization = call read('./apps/data/basic-auth.js') { username: 'admin', password: 'welcome' }
    When method get
    Then status 200
    And print response
    * def jsonResponse = response
    And print jsonResponse
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * print responseCookies

  Scenario: Basic Auth Method2 - Example2 - use Reusable JS function from js file-> Assign user name and password at run time which generates basic auth
    And path '/secure/webapi/all'
    # And header accept = 'application/json'
    # * header Authorization = call read('./apps/data/basic-auth.js') { username: 'admin', password: 'welcome' }
    * def BasicAuthToken = call read('./apps/data/basic-auth.js') {username: 'admin', password: 'welcome'}
    # To use/Access a variable, we need to use embedded expression '#(VariableName)'
    And configure headers = {accept: 'application/json', Authorization: '#(BasicAuthToken)'}
    When method get
    Then status 200
    And print response
    * def jsonResponse = response
    And print jsonResponse
    * print responseStatus
    * print responseTime
    * print responseHeaders
    * print responseCookies
   # * def sumOfNumbers = call read('./apps/data/basic-auth.js') {num1: 10, num2: 20}
   # * print 'sumOfNumbers--',sumOfNumbers
