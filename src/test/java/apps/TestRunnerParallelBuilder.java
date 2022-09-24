package apps;

import org.junit.jupiter.api.Test;
import com.intuit.karate.Runner.Builder;

public class TestRunnerParallelBuilder {
	
	@Test
	public void executeKarateTest() {
		
		Builder pRunner = new Builder();		
		//pRunner.path("classpath:apps/feature/JSfeatures");	//Run all features which is inside JSfeature package and sub packages
		pRunner.path("classpath:apps/feature"); //Run all features which is inside feature package and sub packages
		pRunner.parallel(5);
		
	}

}
