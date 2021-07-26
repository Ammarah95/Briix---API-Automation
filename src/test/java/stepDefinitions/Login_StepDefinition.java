package stepDefinitions;

import java.util.Scanner;

import org.testng.Assert;

import APITesting.Briix.Request;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Login_StepDefinition extends Request{
	public static String resp, tokenId1, authorizedToken1;	
	String email = "ammarah@transformhub.com";
	String password = "Test@1234";
	RequestSpecification request;
	Scanner sc;
	public static String authorizedToken="eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIzZmQ5MzEzYS0zNjdjLTQ3NjQtODFmZi02NmFmNjgwNDQ0NmMifQ.eyJleHAiOjE2MjcyODgzMjQsImlhdCI6MTYyNzI4MTEyNCwianRpIjoiZmJlMjEyZjktZjExYS00OGJhLWJhZjMtY2U4MjE2YzJhMTZhIiwiaXNzIjoiaHR0cDovL2JyaWl4LWtleWNsb2FrLTE2NzUzMzA2MjcuYXAtc291dGhlYXN0LTEuZWxiLmFtYXpvbmF3cy5jb20vYXV0aC9yZWFsbXMvYnJpaXhQZXJtIiwic3ViIjoiZDEyZWYyYzUtMzI1Mi00OTg1LTgyYWMtNmZjMTI2MjBhMDJlIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYnJpaXhCYWNrZW5kIiwic2Vzc2lvbl9zdGF0ZSI6IjM4OGE1YTI2LTA5YTEtNDI5NC05NGU2LWU4YTJiNDVhMTlmZCIsImFjciI6IjEiLCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicHJlZmVycmVkX3VzZXJuYW1lIjoiYXJ1bnRlc3Q4ODg3IiwiZW1haWwiOiJhbW1hcmFoQHRyYW5zZm9ybWh1Yi5jb20ifQ.jogPolX3mgM3LbSODSjSGwrfRXieZszNO6tgr3Yhh6c";

    @Given("Post Login API")
    public void post_login_api() throws Throwable { 
    	request=Request.getPostURL();
    }
    @Given("Get API")
    public void get_login_api() throws Throwable {
//	    RestAssured.baseURI  =  URL;
//		request  =  RestAssured.given();
//		request.header("Content-Type",  "application/json");    
    	request=Request.getGetURL();
    }
    
   @When("Provide Valid Credential")
    public void provide_valid_credential() {
      response  =  request.body("{ \"emailId\":\""  +  email  +  "\", \"password\":\""  +  password  +  "\"}")
						  .post("/Dev/api/admin/signin");
      tokenId();

    }
   
   @When("User Verify the OTP")
   public void user_verify_the_otp() {
	   sc =new Scanner(System.in);
	   System.out.println("Enter the Otp: ");
	   String OTP=sc.nextLine();
	   
     response  =  request.body("{ \"otp\":\""  +  OTP  +  "\", \"emailId\":\""  +  email  +  "\", \"tokenId\":\""  +  tokenId1  +  "\"}")
						  .post("/Dev/api/user/verifylogotp");
     response.prettyPrint();
//     resp=response.getBody().asString();
//     authorizedToken=JsonPath.from(resp).getString("token");
   }

   
   @Then("Extract the token")
   public void extract_the_token() {
	   resp=response.getBody().asString();
	   authorizedToken=JsonPath.from(resp).getString("token");
	   System.out.println(authorizedToken);
   }
   
   @Then("Status_code equals {int}")
    public void statuscode_equals_(int agr) {
	    Assert.assertEquals(agr, response.getStatusCode());
    }
	
	@And("response contains message equals {string}")
    public void response_contains_IsPosted_equals_(String message) {
	    Assert.assertEquals(message, getJsonPath(response, "message"));
	    
    }	

   @And("response contains IsLogin equals {string}")
    public void response_contains_equals_(String message) {
	    Assert.assertEquals(message, getJsonPath(response, "message"));
	    
	    
    }
    
	@When("Provide different combinations to {string} {string}")
    public void provide_different_combinations_to_somethingsomething(String email, String password){
	    response = request.body("{ \"emailId\":\"" + email + "\", \"password\":\"" + password + "\"}") .post("/Dev/api/admin/signin");
    }

	public String getJsonPath(Response response, String key) {
		 resp = response.asString();	
		JsonPath js = new JsonPath(resp);
		return js.get(key).toString();
	}
	public void tokenId() {
		resp=response.getBody().asString();
		tokenId1=JsonPath.from(resp).getString("tokenId");
		System.out.println(tokenId1);
		
	}
	@And("User is authorized")
    public void user_is_authorized() {
		request  =  RestAssured.given();
		System.out.println(authorizedToken);
		request.header("authorizeToken",  authorizedToken);
		
		
		Headers allHeaders = response.headers();
		
		 
		 // Iterate over all the Headers
		 for(Header header : allHeaders)
		 {
		 System.out.println("Key: " + header.getName() + " Value: " + header.getValue());
		 }
	    
    }	

}
