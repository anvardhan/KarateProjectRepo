@ignore
Feature: Helper feature file - should only be called by any calling feature file
  Helper feature file should only contain one scenario with all required variables, functions and operations

  Scenario: Execute Java Script function without parameter
    #Java Script function without parameter
    * def getIntValue = function() { return 10; }
    * print "Value returned from function1-->"+getIntValue()
    #Random Value generation
    * def getRandomValue = function() { return Math.floor((100000) * Math.random()); }
    * def id = getRandomValue()
    * print "Value returned from function2-->"+id
    #Java Script Function with parameter
    * def getStringValue = function(arg1) { return "Hello " + arg1; }
    * print "Value returned from function3-->"+getStringValue("world")
		