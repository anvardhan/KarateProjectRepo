Feature: Validate job entry when pass through Example
  - calling scenarios from other feature file with argument

  Scenario Outline: Create Job entry in the application- With Example - <jobid>
    * def result = call read('01_helperFeature_Createjobentry.feature@tag201') { jobid: '#(jobid)', jobtitle: '#(jobtitle)',  jobdescription: '#(jobdescription)'}
    * print result
    * print result.response
    And match result.response.jobTitle == '<jobtitle>'
    And match result.response.jobId == <jobid>

    Examples: 
      | jobid | jobtitle | jobdescription | status |
      |   101 | SDET     | SDET-101       |    201 |
      |   102 | Manager  | Manager-102    |    201 |
      |   103 |    65747 | Manager-103    |    201 |

  Scenario Outline: Create Job entry in the application- With Example - <jobid>
    * def result = call read('01_helperFeature_Createjobentry.feature@tag400') { jobid: '#(jobid)', jobtitle: '#(jobtitle)',  jobdescription: '#(jobdescription)'}
    * print result
    * print result.response

   And match result.response.error == 'Bad Request'
    #And match result.response.jobId == <jobid>
    Examples: 
      | jobid | jobtitle | jobdescription | status |
      | abc   | SDET     | SDET-101       |    201 |
      | anand | Manager  | Manager-102    |    201 |
