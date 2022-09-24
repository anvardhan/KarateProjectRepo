package apps.feature.configFeatures;

import com.intuit.karate.junit5.Karate;

public class TestRunnerConfigFeature {

	//When we use relativeTo - Below will run if feature file is in same package as TestRunner
	@Karate.Test
	Karate jsConfigTest() {
		return Karate.run("getConfiguration","createjobentry","getjobentry").relativeTo(getClass());
	}

}
