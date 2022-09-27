package apps.feature.callingFeatureAndScenario;

import com.intuit.karate.junit5.Karate;

public class TestRunnercallingFeatureScenarioRequest {
	
	//When we use relativeTo - Below will run if feature file is in same package as TestRunner
		@Karate.Test
		Karate jobEntryPostTest() {
			return Karate.run("VerifyJobEntry_table").relativeTo(getClass());
		}

}
