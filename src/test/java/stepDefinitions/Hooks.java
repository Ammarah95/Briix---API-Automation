package stepDefinitions;


import APITesting.Briix.Request;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;

public class Hooks extends Request {
static	String email = "ammarah@transformhub.com";
static	String password = "Test@1234";
	@Before
	public void beforevalidation() throws Throwable {
	//	request.header("authorizeToken", Login_StepDefinition.authorizedToken);
//		Login_StepDefinition st=new Login_StepDefinition();
//		st.post_login_api();
//		response  =  request.body("{ \"emailId\":\""  +  email  +  "\", \"password\":\""  +  password  +  "\"}")
//				  .post("/Dev/api/admin/signin");
//		st.tokenId();
//		st.user_verify_the_otp();
//		st.extract_the_token();
//		st.user_is_authorized();
	}
	
	@After
	public void takeScreenshotOnFailure(Scenario scenario) throws Exception{
		
	}

}
