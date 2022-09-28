Feature: Call Java Script functions from Helper feature file and also Access Variables defined in helper feature file

  Scenario: Call helper feature file and Access Variables/Java Script function
    * def dataFromOtherFeature = call read("JS_helperFeatureWithJSFunctions.feature")
    # Access Variables defined from other feature file
    * print "get variable data from other feature file --> "+dataFromOtherFeature.id
    # Access Java Script Function1
    * def randomId = dataFromOtherFeature.getRandomValue();
    * print "Random Value: ->"+randomId

  Scenario: Call helper feature file and pass parameter to js function in helper
    * def dataFromOtherFeature = call read("JS_helperFeatureWithJSFunctions.feature")
    # Access Java Script Funtion2
    * def StringData = dataFromOtherFeature.getStringValue("world")
    * print "StringData Value: ->"+StringData

  Scenario: Call helper feature file and pass Variables to helper feature file
    * def getRandomValue = function() { return Math.floor((100000) * Math.random()); }
    * def id = getRandomValue()
    #pass variables to helper feature file
    * def dataFromOtherFeature = call read("JS_helperFeatureWithVariable.feature") {_url: 'www.google.com', _path: 'test', _id: '#(id)'}
