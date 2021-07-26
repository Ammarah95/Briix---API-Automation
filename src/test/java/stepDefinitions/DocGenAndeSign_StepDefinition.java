package stepDefinitions;


import APITesting.Briix.Request;
import io.cucumber.java.en.Given;

import io.cucumber.java.en.When;


public class DocGenAndeSign_StepDefinition extends Request{
	public static String signNowId;
	 @Given("Get document managemnet API")
     public void get_trading_and_sattlement_api() throws Throwable {     
    	request=Request.getDocumentManagementURL();
 
    }
	 @Given("Post document managemnet API")
     public void post_trading_and_sattlement_api() throws Throwable {     
    	request=Request.getDocumentManagementURL();
 
    }
	 
	 @When("send get request {string}")
	    public void user_sends_get_https_request(String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.get(url);
	      response.prettyPrint();
	 }
	 @When("send post body request {string} and https request {string}")
	    public void user_sends_post_body_https_request(String body,String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).post(url);
	      response.prettyPrint();
	 }
//	 @When("sends get request")
//	    public void sends_get_request() throws Throwable {
//		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
//	      response=request.get("/Dev/api/v1.0/documents/signNow/e264a784ac954457a5257ac6f2047fcf38d9d02c/download");
//	      response.prettyPrint();
//	 }
//	 
//	 @Then("Extract the signNowId")
//	    public void Extract_the_signNowId() throws Throwable {
//		 request.header("authorizeToken", Login_StepDefinition.authorizedToken);
//		 resp=response.getBody().asString();
//		 signNowId=JsonPath.from(resp).getString("templateName");
//		 System.out.println(signNowId);
//	 }
	 
}
