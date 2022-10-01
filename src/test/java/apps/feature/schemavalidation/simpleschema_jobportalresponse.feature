Feature: Schema Validation for Get user details JSON response

  Scenario: Schema Validation - Create and Get Job entry in the application - read json payload
    #create record
    Given url 'https://jobportalkarate.herokuapp.com'
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    And def requestPayload = read ('../../data/jsonPayload/jobportaldata.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
    * print response
    * def id = response.jobId
    * def title = response.jobTitle
    #get record
    When path '/normal/webapi/find'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    * def queryParameters = {id:'#(id)',jobTitle:'#(title)'}
    And params queryParameters
    When method get
    Then status 200
    And match response ==
      """
      {
      "jobId": '#number',
      "jobTitle": '#string',
      "project": '#[] #object',
      "jobDescription": "#string",
      "experience": '#[] #string'
      }
      """
      
    Scenario: Schema Validation - store schema in variable and then compare it with response
    #create record
    Given url 'https://jobportalkarate.herokuapp.com'
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    And def requestPayload = read ('../../data/jsonPayload/jobportaldata.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
    * print response
    * def id = response.jobId
    * def title = response.jobTitle
    #get record
    * def mainSchemaSimple = {"jobId": '#number', "jobTitle": '#string', "project": '#[] #object', "jobDescription": "#string", "experience": '#[] #string'}
    When path '/normal/webapi/find'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    * def queryParameters = {id:'#(id)',jobTitle:'#(title)'}
    And params queryParameters
    When method get
    Then status 200
    And match response == mainSchemaSimple
 
