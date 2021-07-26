Feature: Onboarding Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  
  @CustomerSignin
  Scenario Outline: Once the get all request api hit then response should be correct
    Given post onboarding API
    When send body "{\"emailId\":\"<emailId>\",\"password\":\"<password>\"}" and send Https request "/Dev/api/customer/signin"
    Then Status_code equals <status>

    Examples: 
      | emailId                  | password  | status |
      | ammarah@transformhub.com | Test@1234 |    200 |
      | ammarah123@transformhub.com | Test@1234 |    400 |
      
      @AdminSignin
  Scenario Outline: Once the get all request api hit then response should be correct
    Given post onboarding API
    When send body "{\"emailId\":\"<emailId>\",\"password\":\"<password>\"}" and send Https request "/Dev/api/admin/signin"
    Then Status_code equals <status>

    Examples: 
      | emailId                  | password  | status |
      | ammarah@transformhub.com | Test@1234 |    200 |
      | Test123@transformhub.com | Test@1234 |    400 |
      

 