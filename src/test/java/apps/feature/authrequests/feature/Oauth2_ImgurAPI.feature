Feature: oauth 2 test using
		http://coop.apps.symfonycasts.com/token -> For token generation (Access Token URL)
    http://coop.apps.symfonycasts.com/api/me -> Get request - Requires Authentication using OAuth2
    

  Background: 
    * url 'https://api.imgur.com'

  Scenario: oauth 2 flow
    # Generate Oauth2 token
    * path 'oauth2/token'
    * form field grant_type = 'refresh_token'
    * form field client_id = '329d07cd94f2064'
    * form field client_secret = 'd5516168200ccdf5a1ebfa366e0393cd5f37e587'
    * form field refresh_token = '00ad832307b13ef96401e9a3b3a74fbecebe24f0'
    * method post
    * status 200
    * def accessToken = response.access_token
    # * param access_token = accessToken
    * print response
    
    #Send get request - Account Base
    * path '/3/account/anvardhan'
    * header Authorization = 'Bearer ' + accessToken
    * method get
    * status 200
    * print response
    * match response.data.url == 'anvardhan'
	  * match response.data.id == 161451957
	  
	  #Send get request - Account Block status
    * path '/account/v1/anvardhan/block'
    * header Authorization = 'Bearer ' + accessToken
    * method get
    * status 200
    * print response
    * match response.data.blocked == false
