Feature: Execute Java Script Fucntions

  Scenario: Execute Java Script function - Reusable
    * def systemTime = function(){ return java.lang.System.currentTimeMillis() + '' }
    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    * def randomNumber = function(max){ return Math.floor(Math.random() * max) }
    * def comparisionWithoutCase = function(a, b){ return a.equalsIgnoreCase(b) }
    * def comparisionWithCase = function(a, b){ return a.equals(b) }
    * def pauseForMilliseconds = function(pause){ java.lang.Thread.sleep(pause) }
    
    * print "systemTime --> "+systemTime()
    * print "uuid --> "+uuid()
    * print "randomNumber --> "+randomNumber(10000)
    * print "comparisionWithCase --> "+comparisionWithoutCase('Anand','Anand')
    * print "comparisionWithCase --> "+comparisionWithoutCase('Anand','anand')
    * print "comparisionWithCase --> "+comparisionWithCase('Anand','Anand')
    * print "comparisionWithCase --> "+comparisionWithCase('Anand','anand')
