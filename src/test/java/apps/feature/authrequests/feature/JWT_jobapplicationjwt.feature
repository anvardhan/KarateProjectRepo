Feature: Send Get request for App using JWT token

  Scenario: Get Request with Jwt token
    # * def jwtToken = call read('jwtTokenGeneration.feature') {username:'Anand', password:'anand1'}
    # * def jwtToken = call read('../../../data/jwtTokenGeneration.feature') {username:'Anand', password:'anand1'}
    * def jwtToken = call read('../../../../healper/jwtTokenGeneration.feature') {username:'Anand', password:'anand1'}
    
    * def token = jwtToken.authToken
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept:'application/json', Content-Type:'application/json', Authorization: '#("Bearer "+token)'}
    When method get
    Then status 200
    * print response
    
    Scenario: Get Request without Jwt token
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    When method get
    Then status 401
    * print response
