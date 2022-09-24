Feature: java date function called in js function

  @System
  Scenario: Date function
    * def getDate =
      """
      function() {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var sdf = new SimpleDateFormat('yyyy/MM/dd');
        var date = new java.util.Date();
        return sdf.format(date);
      } 
      """
    * def temp = getDate()
    * print "Date: "temp
