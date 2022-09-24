Feature: Working on karate.config

  Scenario: Get global variable values defind in karate.js
    * def myVar = myVarName
    * def uName = username
    * def pwd = password
    * print "myVar: "+myVar
    * print "uName: "+uName
    * print "pwd: "+pwd
