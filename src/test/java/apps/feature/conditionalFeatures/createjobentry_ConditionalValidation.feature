Feature: Create job entry in the application
  Use Post request to create job entry to create job entries in the portal

  Background: Set base url and payload
    * def testdata = read ('../../data/jsonPayload/data.csv')
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario Outline: Create Job entry in the application- Read jsonPayload - <jobid>
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    #use Embedded expression for every variable in json payload
    And def requestPayload = read ('../../data/jsonPayload/jobportaldatadriven.json')
    * print requestPayload
    And request requestPayload
    When method post
    #Then status 201
    Then status <status>
    * print response
    
    * eval if (response.status == 400) karate.abort()

    And match response.jobTitle == '<jobtitle>'
    And match response.jobId == <jobid>
    
    Examples: 
      | jobid | jobtitle | jobdescription | status |
      |   104 | SDET     | SDET-104       |    201 |
      |   105 | Manager  | Manager-105    |    201 |
      | id    | Manager  | Manager-id     |    400 |
      | true  | Manager  | Manager-true   |    400 |
      |   106 |    65747 | Manager-106    |    201 |

  