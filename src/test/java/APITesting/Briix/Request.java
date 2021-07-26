package APITesting.Briix;

import java.io.FileInputStream;
import java.util.Properties;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Request {
	public static Properties prop;
	public static FileInputStream fis;
	protected static RequestSpecification request;
	public static  Response response;
	public  static  String  jsonString;
	public static String resp, tokenId1, token;
	
	public static void headers() {
		request  =  RestAssured.given();
		request.header("Content-Type",  "application/json");
	}
	public static RequestSpecification getPostURL() throws Throwable {
	callingGlobalProperty();
	String Base_request=prop.getProperty("BASE_URL");
	RestAssured.baseURI  =  Base_request;
	headers();
	return request;
	}
	public static RequestSpecification getGetURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("BASE_URL1");
		RestAssured.baseURI  =  Base_request;
		headers(); 
		return request;
	}
	public static RequestSpecification getPost() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("BASE_URL1");
		RestAssured.baseURI  =  Base_request;
		headers(); 
		return request;
	}
	public static RequestSpecification getDocumentManagementURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("DocumentManagement_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getLoanURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("Loan_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getUserAdministrationURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("Useradministration_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getWalletAdministrationURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("WalletAdministration_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getPropertyTradingURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("PropertyTrading_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getProfileManagementURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("ProfileManagement_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getTradingAndSettlementURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("TradingAndSettlemet_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static RequestSpecification getAnalyticIntelligenceURL() throws Throwable {
		callingGlobalProperty();
		String Base_request=prop.getProperty("AnalyticIntelligence_URL");
		RestAssured.baseURI  =  Base_request;
		headers();
		return request;
		}
	public static void callingGlobalProperty() throws Throwable {
		prop = new Properties();
		fis = new FileInputStream("src/test/java/APITesting/Briix/global.properties");
		prop.load(fis);
	}
}
