Feature: Get user details

  Scenario: Create Job entry in the application - read json payload
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
    * print response
    
    #put record - Generally jsonpayload is used as in post
    #patch record   
    
    #delete record and get record - should return 404
    When path '/normal/webapi/remove/'+id
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    When method delete
    Then status 200
    * print response
    When path '/normal/webapi/find'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    * def queryParameters = {id:'#(id)',jobTitle:'#(title)'}
    And params queryParameters
    When method get
    Then status 404
    * print response
    
    

  @ignore
  Scenario: Create/Get/Put/Delete/Get new user
    Given url 'https://gorest.co.in'
    * configure headers = {Content-Type: 'application/json', Accept: '*/*', Connection: 'keep-alive', Authorization: 'Bearer 58af3f196ef94f76a95ea35b155455129942a88b98c2f25a98129a2400589bbf'}
    And request
      """
      {
      "id": 100086,
      "name": "Anand86",
      "email": "anand86@kiehn.com",
      "gender": "male",
      "status": "active"
      }
      """
    And path '/public/v1/users'
    When method POST
    Then status 201

  @ignore
  Scenario: Get user detail
    Given url 'https://gorest.co.in'
    * configure headers = {Content-Type: 'application/json', Accept: '*/*', Connection: 'keep-alive', Authorization: 'Bearer 58af3f196ef94f76a95ea35b155455129942a88b98c2f25a98129a2400589bbf'}
    And path '/public/v1/users'
    * def queryParameters = {status:'active', gender:'male', id:100086}
    And params queryParameters
    When method GET
    Then status 200
    * print response
