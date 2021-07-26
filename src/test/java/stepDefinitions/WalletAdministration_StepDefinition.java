package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class WalletAdministration_StepDefinition extends Request{
	@Given("Get wallet administration API")
    public void get_wallet_administration_api() throws Throwable {     
   	request=Request.getWalletAdministrationURL();

   }
	@Given("Post wallet administration API")
    public void post_wallet_administration_api() throws Throwable {     
   	request=Request.getWalletAdministrationURL();

   }
	 @When("send get Https request {string}")
	    public void user_sends_put_https_request(String url) throws Throwable {
	      response=request.get(url);
	      response.prettyPrint();}
	 
	 @When("User send post request {string} and Https request {string}")
	    public void user_sent_post_body_and_send_https_request(String body, String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).post(url);
	      response.prettyPrint();
	 }
	 @When("User send put request {string} and Https request {string}")
	    public void user_sent_put_body_and_send_https_request(String body, String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).put(url);
	      response.prettyPrint();
	 }
}
