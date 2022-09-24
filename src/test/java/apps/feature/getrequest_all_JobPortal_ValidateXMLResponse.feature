Feature: get jobportal details - XML

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

 Scenario: get job description from jobportal
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    And header accept = 'application/xml'
    When method get
    Then status 200
    And print response
    #index for Array in XML starts at 1
    And match response/List/item/jobId == ['1', '20', '1', '20'] 
		And match response/List/item/jobId contains ['1', '20']
		And match response/List/item/jobId contains ['1']
		And match response/List/item[1]/jobId == '1' 
		And match response/List/item[1]/jobTitle == 'Software Engg' 
		And match response/List/item[2]/jobTitle == 'EEE Engg' 
    And match response/List/item[1]/experience/experience[2] == 'Apple'
   # And match response/List/item[1]/experience/experience[*] == ['Google','Apple','Mobile Iron']
	 # We can traverse XML as like JSON
	 # wild card works only with JSON travserse
	 And match response.List.item[0].experience.experience[1] == 'Apple'
	 #And match response.List.item[0].experience.experience[*] == ['Google','Apple','Mobile Iron']