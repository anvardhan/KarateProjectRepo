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

public class TestRunnerParallelRunner {
	
	@Test
	public void executeKarateTests() throws InterruptedException {
		
		//Results results = Runner.parallel(getClass(),5);
				
		Results results = Runner.path("classpath:apps/feature/callingFeatureAndScenario")
							.outputCucumberJson(true)
							.parallel(5);
		
		//Karate-version - 0.9.6
		/*System.out.println("Total Feature count: "+results.getFeatureCount());		
		System.out.println("Total Scenario count: "+results.getScenarioCount());		
		System.out.println("Total Pass count: "+results.getPassCount());*/
		
		//karate.version - only karate-junit (1.2.0) dependency is enough - remove karate-apache
		System.out.println("Total Scenario count: "+results.getScenariosTotal());
		System.out.println("Total Feature count: "+results.getFeaturesTotal());
		System.out.println("Total Scenario Pass count: "+results.getScenariosPassed());
		
		generateCucumberReport(results.getReportDir()); //getReportDir points to target/karate-reports
		
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
		
	}
	
	//reportDirLocation -> \ProjectFolder\target\karate-reports
	private void generateCucumberReport(String reportDirLocation) { //output directory
		
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
		// Additional metadata presented on main page
		configuration.addClassifications("TestedBy", "Anand");
		configuration.addClassifications("Environment", "QA");
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
