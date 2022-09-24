function fn() {
	var env = karate.env; //get system property karate.env
	karate.log("karate.env system property is: "+env);

	if(!env) {
		env='qa';
	}
	var config = {
			env: env,
			username: 'admin',
			password: 'adminPassword',
			myVarName: 'SomeValue',
			_url: 'https://jobportalkarate.herokuapp.com'
	}
	if(env == 'dev') {
		//customize config variables based on environment
		config.username='adminDev'
		config.password='adminPasswordDev'
		config.myVarName='SomeValueDev'
		config._url= 'https://dev-jobportalkarate.herokuapp.com'
	}else if(env == 'e2e') {
		//customize config variables based on environment
		config.username='adminE2E'
		config.password='adminPasswordE2E'
		config.myVarName='SomeValueE2E'
		config._url= 'https://jobportalkarate.herokuapp.com'
	} else if(env == 'staging') {
		//customize config variables based on environment
		config.username='adminStaging'
		config.password='adminPasswordStaging'
		config.myVarName='SomeValueE2E'
		config._url= 'https://Staging-jobportalkarate.herokuapp.com'
	} else if(env == 'uat') {
		//customize config variables based on environment
		config.username='adminUAT'
		config.password='adminPasswordUAT'
		config.myVarName='SomeValueUAT'
		config._url= 'https://uat-jobportalkarate.herokuapp.com'
	}
	return config;
}