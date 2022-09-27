Feature: Call other feature file - without argument

  Scenario: test to call jobdescription scenario from other feature
    # Read and Call other feature file present in same folder as feature file
    * def feature = read('02_helper_FeatureWithMultipleScenario.feature@getJobInfo')
    * def resultResponse = call feature
    * print resultResponse
    * print resultResponse.response
    * def jsonResponse = resultResponse.response
    * def jobid = jsonResponse.jobId
    * def jobtitile = jsonResponse.jobTitle
    * print 'JobId from other feature-->' + jobid
    * print 'JobTitile from other feature-->' + jobtitile
    
     Scenario: test to call random scenario from other feature
    # Read and Call other feature file present in same folder as feature file
    * def feature = read('02_helper_FeatureWithMultipleScenario.feature@generateRandomString')
    * def resultResponse = call feature
    * print resultResponse.randomString

 
    
