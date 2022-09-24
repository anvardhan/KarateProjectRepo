Feature: Get user details

  Background: 
    Given url 'https://gorest.co.in'

  @Smoke
  Scenario: get all user detail
    Given path '/public/v1/users'
    When method GET
    Then status 200
    * print response
    #check if data is of type array
    And match response.data == '#array'
    #check if each data element is of type object
    And match response.data == '#[] #object'
    #Length of Array
    And match response.data == '#? _.length >= 1'
    #check if a particular id is present
    And match response.data[*].id contains '#number'

  @System
  Scenario: get all user detail and count using length
    Given path '/public/v1/users'
    When method GET
    Then status 200
    * print response
    #check if data is of type array
    And match response.data == '#array'
    * def userCount = response.data.length
    * print userCount
    * match userCount == 10

  @Smoke @Regression
  Scenario: get specefic user detail using path
    Given path '/public/v1/users/2560'
    #https://gorest.co.in/public/v1/users/2560
    When method GET
    Then status 200
    * print response
    And match response.data.id contains '#number'

  Scenario: get specefic user detail using query parameter
    Given path '/public/v1/users'
    And param id = 2606
    #https://gorest.co.in/public/v1/users?id=2606
    When method GET
    Then status 200
    * print response

  @Smoke @Regression
  Scenario: get specefic user detail using query parameter set in variable
    Given path '/public/v1/users'
    * def queryParameters = {status:'active'}
    And params queryParameters
    #https://gorest.co.in/public/v1/users?status=active
    When method GET
    Then status 200
    * print response

  Scenario: get specefic user detail using multiple query parameter set in variable
    Given path '/public/v1/users'
    * def queryParameters = {status:'active', gender:'male'}
    And params queryParameters
    #https://gorest.co.in/public/v1/users?status=active&gender=male
    When method GET
    Then status 200
    * print response

  Scenario: get specefic user detail using multiple query parameter set in variable with id as integer
    Given path '/public/v1/users'
    * def queryParameters = {status:'active', gender:'male', id:2560}
    And params queryParameters
    #https://gorest.co.in/public/v1/users?status=active&gender=male&id=2560
    When method GET
    Then status 200
    * print response

  Scenario: multiple headers
    Given header Content-Type = 'application/json'
    And header Accept = '*/*'
    And header Connection = 'keep-alive'
    And header Authorization = 'Bearer 58af3f196ef94f76a95ea35b155455129942a88b98c2f25a98129a2400589bbf'
    When path '/public/v1/users'
    * def queryParameters = {status:'active', gender:'male', id:2560}
    And params queryParameters
    #https://gorest.co.in/public/v1/users?status=active&gender=male&id=2560
    When method GET
    Then status 200
    * print response

  Scenario: multiple headers in single variable
    * def request_headers = {Content-Type: 'application/json', Accept: '*/*', Connection: 'keep-alive', Authorization: Bearer 58af3f196ef94f76a95ea35b155455129942a88b98c2f25a98129a2400589bbf'}
    Given headers request_headers
    When path '/public/v1/users'
    * def queryParameters = {status:'active', gender:'male', id:2560}
    And params queryParameters
    #https://gorest.co.in/public/v1/users?status=active&gender=male&id=2560
    When method GET
    Then status 200
    * print response

  Scenario: multiple headers using configure headers
    * configure headers = {Content-Type: 'application/json', Accept: '*/*', Connection: 'keep-alive', Authorization: Bearer 58af3f196ef94f76a95ea35b155455129942a88b98c2f25a98129a2400589bbf'}
    When path '/public/v1/users'
    * def queryParameters = {status:'active', gender:'male', id:2560}
    And params queryParameters
    #https://gorest.co.in/public/v1/users?status=active&gender=male&id=2560
    When method GET
    Then status 200
    * print response
