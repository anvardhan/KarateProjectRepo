@ignore
Feature: Feature to be called by other feature

  @getJobInfo
  Scenario: get job description from jobportal - job data of specefic id
    Given url 'https://jobportalkarate.herokuapp.com'
    * def queryParameters = {id:101,jobTitle:'SDET'}
    And path '/normal/webapi/find'
    And params queryParameters
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response

  @generateRandomString
  Scenario: generate random string for email or any test data for post call
    * def random_string =
      """
      function(s) {
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
      
      for(i=0; i<s; i++) {
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      }
      return text;      
      }

      """
    * def randomString = random_string(10);
    * print "random string-->"+ randomString
