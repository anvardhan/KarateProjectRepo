Feature: get jobportal details - JSON

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'
    # Read external json file present in same folder as feature file
    * def expectedResult = read('jobPotal.json')
    
    # Read external json file present outside of fature file - Traverse backward
    * def expectedResult2 = read('../data/resultResponse/jobPotal_data.json')
    # Read external json file present outside of fature file - Traverse forward
    # * def expectedResult2 = read('./apps/data/resultResponse/jobPotal_data.json')

  Scenario: get job description from jobportal using Background to set base url and use of path and request header
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: get job description from jobportal using Background to set base url and use of path and request header
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200    
    And match response == expectedResult
