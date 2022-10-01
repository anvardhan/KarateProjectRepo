Feature: Validation of response using jsonPath API

  Scenario: Usage of Karate.jsonPath
    #create record
    Given url 'https://jobportalkarate.herokuapp.com'
    Given path '/normal/webapi/add'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    And def requestPayload = read ('../../data/jsonPayload/jobportaldata.json')
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
   # * print response
    * def id = response.jobId
    * def title = response.jobTitle
    #get
    When path '/normal/webapi/find'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    * def queryParameters = {id:'#(id)',jobTitle:'#(title)'}
    And params queryParameters
    When method get
    Then status 200
    * print response
    #retrieve jobId and JobTitle and match with id and title
    * def jobid = karate.jsonPath(response, "$.jobId")
    * def jobtitle = karate.jsonPath(response, "$.jobTitle")
    * print "jobId --> "+jobid+" jobTitle -->"+jobtitle
    * match jobid == id
    * match jobtitle == title
  
 
    Scenario: Complex Usage of Karate.jsonPath
    Given url 'https://jobportalkarate.herokuapp.com'
    When path '/normal/webapi/all'
    * configure headers = {Content-Type: 'application/json', Accept: 'application/json'}
    When method get
    Then status 200
    * print response
    # get experience array of each record
    * def experience = karate.jsonPath(response, "$[*].experience")
    * print experience
    #get length of experience array in each record
    * def experienceLength = karate.jsonPath(response, "$[*].experience.length()")
    * print "Experience Length of each record: "+experienceLength
    #get length of 1st experience array
    * def experience1Length = karate.jsonPath(response, "$[1].experience.length()")
    * print "Experience Length of 1st record: "+experience1Length
    #get json object of the record for which jobid = 1
    * def jsonObjectRecord1 = karate.jsonPath(response, "$[?(@.jobId == 1)].*")
    * print "jsonObjectRecord1: "+jsonObjectRecord1
    #get experience array of the record for which jobid = 1
    * def jsonObjectExperienceRecord1 = karate.jsonPath(response, "$[?(@.jobId == 1)].experience")
    * print "jsonObjectExperienceRecord1: "+jsonObjectExperienceRecord1
     #get jobTitle of the record for which jobid = 1
    * def job_title = karate.jsonPath(response, "$[?(@.jobId == 1)].jobTitle")
    * print "job_title: "+job_title
