package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class Onboarding_StepDefinition extends Request{
	 @Given("post onboarding API")
     public void post_trading_and_sattlement_api() throws Throwable {     
    	request=Request.getOnboardingURL();
 
    }
	 @When("send body {string} and send Https request {string}")
	    public void user_sends_post_body_https_request(String body,String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).post(url);
	      response.prettyPrint();
	 }
}
