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
import java.util.Collection;
import java.util.List;

public class TestRunnerParallelRunnerWithTags {
	
	@Test
	public void executeKarateTests() {
		
		//All feature file which is present inside feature package and its child package
		//Results results = Runner.parallel(getClass(),5);
		//Results results = Runner.path("classpath:apps/feature").parallel(5);
		
		//Note - If we specify tags using tags() method then all feature and scenarios (under the specified package or child package) 
		//which are marked as specified tag will be executed.
		
		//This will run features and scenario which is tagged with Smoke/Regression/System
		Results results = Runner.path("classpath:apps/feature").tags("@System").parallel(5); 
				
		//Act as AND condition if we specify more than one tag as below. i.e tagged with both Smoke and Regression
		//Results results = Runner.path("classpath:apps/feature").tags("@Regression", "@Smoke").parallel(5);
		
		System.out.println("Total Feature count: "+results.getFeatureCount());
		System.out.println("Total Scenario count: "+results.getScenarioCount());
		System.out.println("Total Pass count: "+results.getPassCount());
		
		//generateCucumberReport(results.getReportDir()); //getReportDir points to target/surefire-reports
		
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
		Configuration configuration = new Configuration(reportDir, "Karate Demo Project");
		//ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		Reportable result = reportBuilder.generateReports();
		//result - We can decide what to do if report has failed
	}
	
	//FileUtils.listFiles(directory, extensions, recursive);
	//listFiles - Finds files within a given directory (and optionally its sub directories) which match an array of extensions.
	//Parameters:directory the directory to search in extensions an array of extensions, ex. {"java","xml"}. 
	//If this extension parameter is null, all files are returned.
	//recursive if true all sub directories are searched as well
	//Returns:a collection of java.io.File with the matching files

}
