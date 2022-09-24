package apps.feature;

import com.intuit.karate.junit5.Karate;

public class TestRunnerUnderFeature {
	
	//When we use relativeTo - Below will run if feature file is in same package as TestRunner
	@Karate.Test
	Karate goRestTest() {
		return Karate.run("getrequest_GoRestAPI_MultipleHeaders_MultipleQueryParams").relativeTo(getClass());
	}
	
	//When we use relativeTo - Below will run if feature file is in same package as TestRunner
	@Karate.Test
	Karate jobPortalallTest() {
		return Karate.run("getrequest_all_JobPortal_ValidateJSONResponse").relativeTo(getClass());
	}
	
	//This will not run as feature file and TestRunner not in same package
	/*@Karate.Test
	Karate jsExample1Test() {
		return Karate.run("jsExample").relativeTo(getClass());
	} */
	
	//When we use classpath - Below will run from TestRunner if feature files are under same level package or child package.
	@Karate.Test
	Karate jsExampleTest() {
		return Karate.run("classpath:apps/feature/JSfeatures/jsExample.feature");
	}

}
