package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.specification.RequestSpecification;

public class ProfileManagement_StepDefinition extends Request {
	RequestSpecification request;
	@Given("Get Profile Management API")
    public void get_profile_management_api() throws Throwable {     
    	request=Request.getProfileManagementURL();
  }
 @When("User send request {string}")
    public void user_send_request(String url) throws Throwable {
      request.header("authorizeToken", Login_StepDefinition.authorizedToken);
      response=request.get(url);
      response.prettyPrint();
    }
 @When("User send request body {string} and send request URL {string}")
 public void user_send_request_body(String body,String url) throws Throwable {
   request.header("authorizeToken", Login_StepDefinition.authorizedToken);
   response=request.body(body).post(url);
   response.prettyPrint();
   
 }

}
