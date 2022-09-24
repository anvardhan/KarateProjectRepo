@Smoke @Regression
Feature: get jobportal details - JSON

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: get job description from jobportal - validate using Fuzzy matcher
    And path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response
    * def jsonResponse = response
    And print jsonResponse
    #Note that #present and #notpresent only make sense when you are matching within a JSON or XML context or using a JsonPath or XPath on the left-hand-side.
    #Actual value can be any type or even null, but the key must be present ->#present
    And match jsonResponse[0].jobId == '#present'
    And match jsonResponse[0].jobRank == '#notpresent'
    And match jsonResponse[0].jobId == '#number'
    And match jsonResponse[0].jobTitle == '#string'
    And match jsonResponse[0].experience == '#notnull'
    And match jsonResponse[0].project[0].projectName == '#ignore'
    And match jsonResponse[0].project[0].technology == '#array'
    And match jsonResponse[0] == '#object'
    And match jsonResponse[0].project[0] == '#object'

  Scenario: get job description from jobportal - validate using complex Fuzzy matcher
    And path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    * def jsonResponse = response
    And print jsonResponse
    # (1) '#[NUM] EXPR' --> Validates Array
    # should be an Array
    * match jsonResponse[0].project[0].technology == '#[]'
    # should be an Array of size 3
    * match jsonResponse[0].project[0].technology == '#[1]'
    # should be an Array of strings with size 3
    * match jsonResponse[0].project[0].technology == '#[1] #string'
    
    # (2) '#? JavaScriptExpr' --> _ represent (in below exp) the value returned JsonPath expression and then perform operation on it
    #In this 1st case _ represents a Array and length on it returns 3
    * match jsonResponse[0].project[0].technology == '#? _.length >= 1' 
    
    #In this 2nd case _ represents a String value and length on it returns 6
    * match jsonResponse[0].project[0].technology[0] == '#? _.length == 6'
    
    #Validate jobTitle is string and its length is equal to 13
    * match jsonResponse[0].jobTitle == '#string? _.length == 4'
    
    #Validate jobID is number and its length is equal to 1
    * match jsonResponse[0].jobId == '#number? _ >= 1'
    * match jsonResponse[0].jobId == '#? _ >= 1'
    
    # Combine 1 and 2 -> Validate Array of String with size or array as 1 + validate length of each string value is more than 1
    * match jsonResponse[0].project[0].technology == '#[1] #string? _.length >= 1'
    
    # should be an array of strings each element length should be 3 or more than 3
		* match jsonResponse[0].project[0].technology == '#[] #string? _.length >= 3'

    # each array element should have a 'length' property with value 3 or greater than 3
		* match jsonResponse[0].project[0].technology == '#[]? _.length >= 3'
		
		# should be null or an array of strings
		* match jsonResponse[0].project[0].technology == '##[] #string'
    