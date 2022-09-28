@ignore
Feature: Create job entry in the application
  Use Post request to create job entries in the portal
  Calling this feature below scenario we need to pass 3 input - | jobid | jobtitle | jobdescription |

  @tag201
  Scenario: Create Job entry in the application- Call This scenario and Pass Table
    Given url 'https://jobportalkarate.herokuapp.com'
    And path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    #use Embedded expression for every variable in json payload
    * def requestPayload = read ('../../data/jsonPayload/jobportaldatadriven.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201

  @tag400
  Scenario: Create Job entry in the application- Call This scenario and Pass Table
    Given url 'https://jobportalkarate.herokuapp.com'
    And path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    #use Embedded expression for every variable in json payload
    * def requestPayload = read ('../../data/jsonPayload/jobportaldatadriven.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 400
