package apps.feature.conditionalFeatures;

import com.intuit.karate.junit5.Karate;

public class TestRunnerConditionalFeature {

	//When we use relativeTo - Below will run if feature file is in same package as TestRunner
	@Karate.Test
	Karate conditionalTest() {
		return Karate.run("createjobentry_ConditionalValidation","createjobentry_karate_fail.feature").relativeTo(getClass());
	}

}
