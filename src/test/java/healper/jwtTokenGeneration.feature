@ignore
Feature: Generate JWT token for below App
  	https://jobapplicationjwt.herokuapp.com/swagger-ui.html#/

  Scenario: Register user and generate JWT token
    #Register user
    Given url 'https://jobapplicationjwt.herokuapp.com/users/sign-up'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    And request {username: '#(username)', password: '#(password)'}
    When method post
    Then status 200
    #Generate Token
    Given url 'https://jobapplicationjwt.herokuapp.com/users/authenticate'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    And request {username: '#(username)', password: '#(password)'}
    When method post
    Then status 200
    * print response
    * def authToken = response.token
