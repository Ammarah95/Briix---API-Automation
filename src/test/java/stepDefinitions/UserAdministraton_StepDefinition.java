package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.specification.RequestSpecification;

public class UserAdministraton_StepDefinition extends Request {
	RequestSpecification request;
	 @Given("Get all User Administration API")
	    public void get_all_administartion_api() throws Throwable {     
	    	request=Request.getUserAdministrationURL();
	  }
	 @When("User send Get request {string}")
	    public void user_sent_get_request(String url) throws Throwable {
	      request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.get(url);
	      response.prettyPrint();
	    }
	 @Given("Put update customer details API")
	    public void put_update_customer_details_API() throws Throwable {     
	    	request=Request.getUserAdministrationURL();
	  }
	 
	 @When("User send PUT request {string} and send HTTPs request {string}")
	    public void user_sent_put_https_request(String body, String url) throws Throwable {	
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).put(url);
	      response.prettyPrint();
	    }
	 
}
