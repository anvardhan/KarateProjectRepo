Feature: Feature to be called by other feature

  Scenario: Calling scenario within same feature to get job description from jobportal
    * def result = call read('CallOther_scenario_WithinSameFeature.feature@getJobInfo')
    * print result
    * print result.response

  @ignore @getJobInfo
  Scenario: get job description from jobportal - job data of specefic id
    Given url 'https://jobportalkarate.herokuapp.com'
    * def queryParameters = {id:101,jobTitle:'SDET'}
    And path '/normal/webapi/find'
    And params queryParameters
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response

	@System
  Scenario: print scenario result
    * print "Hi"
