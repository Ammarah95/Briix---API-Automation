package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class Analyticntelligence_SetepDefinition extends Request{
	 @Given("Post the API")
	    public void post_login_api() throws Throwable { 
	    	request=Request.getAnalyticIntelligenceURL();
	    }
	 @When("User send Post body request {string} and send Https request {string}")
	    public void user_sent_post_body_and_send_https_request(String body, String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).post(url);
	      response.prettyPrint();
	 }
}
