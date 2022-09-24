Feature: Call other feature file

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'
    # Read and Call other feature file present in same folder as feature file
    * def feature = read('getrequest_all_JobPortal_callThisFeatureforRead.feature')
    * def resultResponse = call feature

  Scenario: test to call other feature
    
    * print resultResponse
    * print resultResponse.response
    * def jobid = resultResponse.response[0].jobId
    * def jobtitile = resultResponse.response[0].jobTitle
    * print 'JobId from other feature-->' + jobid
    * print 'JobTitile from other feature-->' + jobtitile

 
