@System
Feature: call java methods

	
  Scenario: call java methods in feature file
    #load java class
    * def javaClass = Java.type('javahelper.JavaCommonMethods')
    #call non static method - create object of class and use obj reference to call non static methods
    * def obj1 = new javaClass()
    * def strData1 = obj1.testMethod1()
    * print "strData1-->"+strData1
    * def strData2 = obj1.testMethod2("Hi NonStatic")
    * print "strData2-->"+strData2
    #call static method - No need to create object of java class
    * def strData3 = javaClass.testMethod3("Hi static")
    * print "strData3-->"+strData3

  @Smoke @ignore
  Scenario: Verify if jobid = 1 is present in response then validate "jobTitle": "Software Engg"
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    When method get
    Then status 200
    #And print response
    #response is json Array itself
    * def jsonResponse = response
    * def javaClass = Java.type('javahelper.JavaCommonMethods')
    * javaClass.jobTitle(jsonResponse)
