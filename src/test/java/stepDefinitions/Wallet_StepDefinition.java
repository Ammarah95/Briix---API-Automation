package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.specification.RequestSpecification;



public class Wallet_StepDefinition extends Request{
	public static RequestSpecification request;
	 @Given("POST API")
	    public void get_login_api() throws Throwable {     
	    	request=Request.getPost();
	 
	    }
	@When("User send Get Https request {string}")
    public void user_sent_get_https_request(String url) throws Throwable {
    request=Request.getGetURL();
      request.header("authorizeToken", Login_StepDefinition.authorizedToken);
      response=request.get(url);
      response.prettyPrint();
    }
	
	@When("User send Post body {string} and Https request {string}")
    public void user_sent_post_https_request(String body, String url) throws Throwable {
		
	  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
      response=request.body(body).post(url);
      response.prettyPrint();
      
      
    }
	
	
}
