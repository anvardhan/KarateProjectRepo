package apps;

import org.apache.commons.io.FileUtils;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;

import com.intuit.karate.Results;
import static org.junit.jupiter.api.Assertions.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class TestRunnerParallelRunnerWithTagsDynamic {

	private static final String CLASS_PATH = "classpath:";

	@Test
	public void executeKarateTests() {

		//All feature file which is present inside feature package and its child package
		//Results results = Runner.parallel(getClass(),5);
		//Results results = Runner.path("classpath:apps/feature").parallel(5);

		//Note - If we specify tags using tags() method then all feature and scenarios (under the specified package or child package) 
		//which are marked as specified tag will be executed.

		//This will run features and scenario which is tagged with Smoke/Regression/System
		//Results results = Runner.path("classpath:apps/feature").tags("@Smoke").parallel(5); 

		//Act as AND condition if we specify more than one tag as below. 
		//i.e All feature file which is tagged with both Smoke and Regression will be selected for execution within the specified package
		//Results results = Runner.path("classpath:apps/feature").tags("@Regression", "@Smoke").parallel(5);

		//Dynamically pass location and tags at Run time 
		//- use overloaded method of path and tags which accepts List<String>		
		Results results = Runner.path(getPath()).tags(getTags()).outputCucumberJson(true).parallel(5);


		//Karate-version - 0.9.6
		/*System.out.println("Total Feature count: "+results.getFeatureCount());		
		  System.out.println("Total Scenario count: "+results.getScenarioCount());		
		  System.out.println("Total Pass count: "+results.getPassCount());*/

		//karate.version - only karate-junit (1.2.0) dependency is enough - remove karate-apache
		System.out.println("Total Scenario count: "+results.getScenariosTotal());
		System.out.println("Total Feature count: "+results.getFeaturesTotal());
		System.out.println("Total Scenario Pass count: "+results.getScenariosPassed());

		//works only with karate-apache - 0.9.6 and Junit5 1.2.0
		//generateCucumberReport(results.getReportDir()); //getReportDir points to target/karate-reports

		assertEquals(0, results.getFailCount(), results.getErrorMessages());

	}

	//reportDirLocation -> \ProjectFolder\target\surefire-reports
	private void generateCucumberReport(String reportDirLocation) {

		File reportDir = new File(reportDirLocation);
		//List all json files	//FileUtils.listFiles(directory, extensions, recursive);
		Collection<File> jsonCollectionFiles = FileUtils.listFiles(reportDir, new String[] {"json"}, true);

		//ArrayList to store json path of each json file
		List<String> jsonFiles = new ArrayList<String>();

		//Get absolute path of each json file and add it in array list
		jsonCollectionFiles.forEach(file -> jsonFiles.add(file.getAbsolutePath()));

		//Configuration object - setup configuration as needed
		//Configuration configuration = new Configuration(reportDirectory, projectName)
		//Configuration configuration = new Configuration(reportDir, "Karate Demo Project");
		Configuration configuration = new Configuration(new File("target"), "Karate Demo Project");
		configuration.addClassifications("TestedBy", "Anand");
		configuration.addClassifications("Environment", "QA");
		//ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		Reportable result = reportBuilder.generateReports();
		//result - We can decide what to do if report has failed
	}


	//These 2 private methods will read the system properties values which is set through VM Arguments or Maven
	//This method should return List<String> which will be passed to path method
	/*private List<String> getPath() {

		String locationValues = System.getProperty("location", "apps/feature"); //@Regression is default if we do not set Argument then default values will be picked.
		List<String> locationList = Arrays.asList(CLASS_PATH + locationValues);

		return locationList;
	}

	//This method should return List<String> which will be passed to tags method
	private List<String> getTags() {

		//String tags = System.getProperty(key, def);
		String tagValue = System.getProperty("tags", "@Regression"); //@Regression is default if we do not set Argument then default values will be picked.

		List<String> tagList = Arrays.asList(tagValue);

		return tagList;
	} */

	//Above two method supports only single location/tag. Below two methods will handle multiple location/tags
	private List<String> getPath() {

		String locationValue = System.getProperty("location", "apps/feature"); //@Regression is default if we do not set Argument then default values will be picked.
		//List<String> locationList = Arrays.asList(CLASS_PATH + locationValue);
		List<String> locationList = Collections.emptyList();		

		if(locationValue.contains(",")) {
			String[] locationValueArray = locationValue.split(",");
			locationList = Arrays.asList(locationValueArray);
			locationList.replaceAll((entry) -> {
				return CLASS_PATH + entry;
			});
			return locationList;
		}
		locationList = Arrays.asList(CLASS_PATH + locationValue);
		return locationList;
	}

	//This method should return List<String> which will be passed to tags method
	private List<String> getTags() {

		//String tags = System.getProperty(key, def);
		String tagValue = System.getProperty("tags", "@Regression"); //@Regression is default if we do not set Argument then default values will be picked.
		List<String> tagList = Collections.emptyList();

		if(tagValue.contains(",")) {
			String[] tagValueArray = tagValue.split(",");
			tagList = Arrays.asList(tagValueArray);
			return tagList;
		}
		tagList = Arrays.asList(tagValue);
		return tagList;
	}







}
