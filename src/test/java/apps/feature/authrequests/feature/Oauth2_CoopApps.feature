Feature: oauth 2 test using
		http://coop.apps.symfonycasts.com/token -> For token generation (Access Token URL)
    http://coop.apps.symfonycasts.com/api/me -> Get request - Requires Authentication using OAuth2
    

  Background: 
    * url 'http://coop.apps.symfonycasts.com'

  Scenario: oauth 2 flow - use form field
    # Generate Oauth2 token
    * path 'token'
    * form field grant_type = 'client_credentials'
    * form field client_id = 'MyAPITestApp2'
    * form field client_secret = '40a83d177d25ae73515c42e2555d84c5'
    * method post
    * status 200
    * def accessToken = response.access_token
    # * param access_token = accessToken
    * print response
    
    #Send get request
    * path '/api/me'
    * header Authorization = 'Bearer ' + accessToken
    * method get
    * status 200
    * print response
    * match response.firstName == 'Anand'
	  * match response.lastName == 'Vardhan'
	  
	  Scenario: oauth 2 flow - use form fields
    # Generate Oauth2 token
    * path 'token'
    #* form field grant_type = 'client_credentials'
    #* form field client_id = 'MyAPITestApp2'
    #* form field client_secret = '40a83d177d25ae73515c42e2555d84c5'
    * def credentials = {grant_type:'client_credentials',client_id: 'MyAPITestApp2',client_secret: '40a83d177d25ae73515c42e2555d84c5'}
    * form fields credentials
    * method post
    * status 200
    * def accessToken = response.access_token
    # * param access_token = accessToken
    * print response
    
    #Send get request
    * path '/api/me'
    * header Authorization = 'Bearer ' + accessToken
    * method get
    * status 200
    * print response
    * match response.firstName == 'Anand'
	  * match response.lastName == 'Vardhan'