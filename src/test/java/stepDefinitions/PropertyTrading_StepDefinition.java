package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.specification.RequestSpecification;

public class PropertyTrading_StepDefinition extends Request {
	RequestSpecification request;
	 @Given("Get all Property Trading API")
	    public void get_all_property_trading_api() throws Throwable {     
	    	request=Request.getPropertyTradingURL();
	  }
	 @When("User send Https request {string}")
	    public void user_sent_get_https_request(String url) throws Throwable {
	      request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.get(url);
	      response.prettyPrint();
	    }
	 
	 @When("User PUT request {string} and send HTTPs request {string}")
	    public void user_sent_put_https_request(String body, String url) throws Throwable {	
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).put(url);
	      response.prettyPrint();
	    }
	 

}
