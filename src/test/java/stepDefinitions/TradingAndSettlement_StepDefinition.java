package stepDefinitions;

import APITesting.Briix.Request;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.specification.RequestSpecification;

public class TradingAndSettlement_StepDefinition extends Request {
	RequestSpecification request;
	public static String cashYield;
	 @Given("Post cash yield API")
	     public void post_cash_yield_api() throws Throwable {     
	    	request=Request.getTradingAndSettlementURL();
	 
	    }
	 @Given("Get Trading and Sattlement API")
     public void get_trading_and_sattlement_api() throws Throwable {     
    	request=Request.getTradingAndSettlementURL();
 
    }
	 @Given("Put Trading and Sattlement API")
     public void put_trading_and_sattlement_api() throws Throwable {     
    	request=Request.getTradingAndSettlementURL();
    	request.header("authorizeToken", Login_StepDefinition.authorizedToken);
 
    }
	 @When("User send Post Body {string} and send Https request {string}")
	    public void user_sent_post_body_and_send_https_request(String body, String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.body(body).post(url);
	      response.prettyPrint();
	 }
	 @When("User sends Put Https request {string}")
	    public void user_sends_put_https_request(String url) throws Throwable {
		//  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.put(url);
	      response.prettyPrint();}
	 
	 @When("User sends Get Https request {string}")
	    public void user_sends_get_https_request(String url) throws Throwable {
		  request.header("authorizeToken", Login_StepDefinition.authorizedToken);
	      response=request.get(url);
	      response.prettyPrint();
	      
//	      resp=response.getBody().asString();
//	      cashYield=JsonPath.from(resp).getString("cashYield");
//	      System.out.println(cashYield);
	      
	      
	    }

}
