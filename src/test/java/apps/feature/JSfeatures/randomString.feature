Feature: Generate Random String

  Scenario: generate random string for email or any test data for post call
    * def rendom_string =
      """
      function(s) {
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
      
      for(i=0; i<s; i++) {
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      }
      return text;      
      }
      
      """
     
     * def randomString = rendom_string(10);
     * print "random string-->"+ randomString
