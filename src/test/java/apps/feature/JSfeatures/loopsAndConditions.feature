Feature: Verify total records in Array

  Scenario: Verify total job records
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    When method get
    Then status 200
    And print response
    #response is json Array itself
    * def jsonResponse = response
    * print "jobRecords-->"+jsonResponse
    #Reusable Java Script function which find total length of any array
    * def myFun =
      """
      function(arg) {
      	return arg.length
      }

      """
    * def noOfjobs = myFun(jsonResponse)
    #* def noOfjobs = call myFun jsonResponse
    * print 'noOfjobs-->'+noOfjobs
    And assert noOfjobs >= 1

  Scenario: Verify total technology records of 1st job
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    When method get
    Then status 200
    And print response
    * def jsonResponse = response
    * print jsonResponse[0]
    * def technology = jsonResponse[0].project[0].technology
    * print "technology-->"+technology
    #Reusable Java Script function which find total length of any array
    * def myFun =
      """
      function(arg) {
      	return arg.length
      }

      """
    * def noOfTechnology = myFun(technology)
    #* def noOfTechnology = call myFun technology
    * print 'noOFTechnology-->'+noOfTechnology
    And match noOfTechnology == 3

  Scenario: Verify if jobid = 1 is present in response then validate "jobTitle": "Software Engg"
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    When method get
    Then status 200
    And print response
    #response is json Array itself
    * def jsonResponse = response
    #Reusable Java Script function - loop through array and if specefic jobId present then return jobTitle
    * def myFun2 =
      """
      function(arg) {
      	var jobLength = arg.length
      	for(i=0;i<jobLength;i++) {
      	if(arg[i].jobId == 1) {
      		return arg[i].jobTitle
      	}
      	}
      }

      """
    * def actualJobTitle = myFun2(jsonResponse)
    #* def actualJobTitle = call myFun2 jsonResponse
    * print 'actualJobTitle-->'+actualJobTitle
    And match actualJobTitle == 'Software Engg'

  Scenario: Verify if jobid = 1 is present in response then return job record and validate "jobTitle": "Software Engg"
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    When method get
    Then status 200
    And print response
    #response is json Array itself
    * def jsonResponse = response
    #Reusable Java Script function - loop through array and if specefic jobId present then return entire job record 
    * def myFun3 =
      """
      function(arg) {
      	var jobLength = arg.length
      	for(i=0;i<jobLength;i++) {
      	if(arg[i].jobId == 1) {
      		return arg[i]
      	}
      	}
      }

      """
    * def jobRecord = myFun3(jsonResponse)
    #* def jobRecord = call myFun3 jsonResponse
    * print 'jobRecord-->'+jobRecord
    And match jobRecord.jobTitle == 'Software Engg'
    And match jobRecord.project[0].projectName == 'Movie App'
