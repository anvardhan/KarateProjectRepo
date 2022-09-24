Feature: Execute Java Script Fucntions

  Scenario: Execute Java Script function without parameter
    #Java Script function without parameter
    * def getIntValue = function() { return 10; }
    * print "Value returned from function1-->"+getIntValue()
    #Random Value generation
    * def getRandomValue = function() { return Math.floor((100000) * Math.random()); }
    * def id = getRandomValue()
    * print "Value returned from function2-->"+id
    # Java Script Function using call keyword
    * def myFun = function() {return "Hello"}
    * def returnedData1 = call myFun
    * print "Returned data1: ",returnedData1
    * def returnedData2 = myFun()
    * print "Returned data2: ",returnedData2

  Scenario: Execute Java Script function having more than 1 line
    #Java Script Function with parameter
    * def getStringValue = function(arg1) { return "Hello " + arg1; }
    * print "Value returned from function3-->"+getStringValue("world")

  Scenario: Execute Java Script function having multiple blocks
    #Java Script Function with/without parameter
    * def myFun1 =
      """
      function(arg1) { 
      return "Hello " + arg1; 
      }

      """
    * print "Returned data myFun1-->"+myFun1("world")
    * def myFun2 =
      """
      function() { 
      var a1=10
      var a2=20
      return a1+a2 
      }

      """
    * print "Returned data myFun2-->"+myFun2()
