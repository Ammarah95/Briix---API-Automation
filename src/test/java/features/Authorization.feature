Feature: Login Functionality

Background:
   Given Post Login API
    When Provide Valid Credential
    Then Status_code equals 200
    And response contains IsLogin equals "User signin successfull, please verify OTP"
    When User Verify the OTP
    
  @Authorization
  Scenario: User Should Authorized
    Then Extract the token
    And User is authorized
