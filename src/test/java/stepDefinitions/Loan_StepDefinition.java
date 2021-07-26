package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class Loan_StepDefinition extends Request {
	 @Given("post the loan API")
     public void post_the_loan_api() throws Throwable {     
    	request=Request.getLoanURL();
    	request.header("authorizeToken", Login_StepDefinition.authorizedToken);
 
    }
	 @When("send the body {string} and Https request {string}")
	    public void user_sent_post_body_and_send_https_request(String body, String url) throws Throwable {
//		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).post(url);
	      response.prettyPrint();
	 }

}
