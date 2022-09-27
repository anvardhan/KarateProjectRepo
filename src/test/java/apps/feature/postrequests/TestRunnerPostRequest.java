package apps.feature.postrequests;

import com.intuit.karate.junit5.Karate;

public class TestRunnerPostRequest {
	
	//When we use relativeTo - Below will run if feature file is in same package as TestRunner
		@Karate.Test
		Karate jobEntryPostTest() {
			return Karate.run("post_createjobentry_DataDriven").relativeTo(getClass());
		}

}
