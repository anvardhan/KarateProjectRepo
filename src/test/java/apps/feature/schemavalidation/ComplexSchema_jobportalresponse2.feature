Feature: Complex Schema Validation for Get user details JSON response

  Scenario: Complext Schema Validation single json object
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
    * def projectSchema = {"projectName" : '#string', "technology": '#[] #string'}
    * def mainSchema = {"jobId": '#number', "jobTitle": '#string', "jobDescription": '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
    When path '/normal/webapi/find'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    * def queryParameters = {id:'#(id)',jobTitle:'#(title)'}
    And params queryParameters
    When method get
    Then status 200
    * print response
    And match response == mainSchema
    
    Scenario: Complext Schema Validation - main json object inside Array
    * def projectSchema = {"projectName" : '#string', "technology": '#[] #string'}
    * def mainSchema = {"jobId": '#number', "jobTitle": '#string', "jobDescription": '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
    * def mainSchemaWithArray = '#[] ##(mainSchema)'
    Given url 'https://jobportalkarate.herokuapp.com'
    When path '/normal/webapi/all'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    When method get
    Then status 200
    * print response
    And match response == mainSchemaWithArray
