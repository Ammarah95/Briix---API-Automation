package cucumberOptions;
import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;



@RunWith(Cucumber.class)
@CucumberOptions(
		features="src/test/java/features",
		glue="stepDefinitions",
        tags= "@UploadDocuments",    
        monochrome=true, dryRun=false,
        plugin= {"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:",
				"pretty","html:target/report.html","junit:target/report.xml","json:target/report.json"}
		)
public class TestRunner {

}

