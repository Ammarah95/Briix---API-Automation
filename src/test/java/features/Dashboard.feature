Feature: Analytical and Intelligence Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  
  @SoldpropertyDeals
  Scenario Outline: Once the Sold Property Deals api hit then response should be correct
    Given Post the API
    When User send Post body request "{\"dateType\": \"<dateType>\",\"month\": <month>,\"year\": <year>}" and send Https request "/Dev/analyticintelligence/api/v1.0/analytics/propertydeals/closed"
    Then Status_code equals <status>

    Examples: 
      | dateType | month | year | status |
      | Weekly   |     7 | 2021 |    200 |
      | Monthly  | null  | 2021 |    200 |
      | Yearly   | null  | null |    200 |
      | Weekly   |     7 | 2022 |    400 |
      
   @GetWalletTransaction
  Scenario Outline: Once the Get wallet transaction api hit then response should be correct
    Given Post the API
    When User send Post body request "{\"dateType\": \"<dateType>\",\"month\": <month>,\"year\": <year>}" and send Https request "/Dev/analyticintelligence/api/v1.0/analytics/wallettransactions"
    Then Status_code equals <status>

    Examples: 
      | dateType | month | year | status |
      | Weekly   |     7 | 2021 |    200 |
      | Monthly  | null  | 2021 |    200 |
      | Yearly   | null  | null |    200 |
      | Weekly   |     7 | 2022 |    400 |
      
  @GetLoginDtails
  Scenario Outline: Once the Get login details api hit then response should be correct
    Given Post the API
    When User send Post body request "{\"dateType\": \"<dateType>\",\"month\": <month>,\"year\": <year>}" and send Https request "/Dev/analyticintelligence/api/v1.0/analytics/logins"
    Then Status_code equals <status>

    Examples: 
      | dateType | month | year | status |
      | Weekly   |     7 | 2021 |    200 |
      | Monthly  | null  | 2021 |    200 |
      | Yearly   | null  | null |    200 |
      | Weekly   |     7 | 2022 |    400 |
      
  @GetLoanPayment
  Scenario Outline: Once the Get loan payment api hit then response should be correct
    Given Post the API
    When User send Post body request "{\"dateType\": \"<dateType>\",\"month\": <month>,\"year\": <year>}" and send Https request "/Dev/analyticintelligence/api/v1.0/analytics/loanpayments"
    Then Status_code equals <status>

    Examples: 
      | dateType | month | year | status |
      | Weekly   |     7 | 2021 |    200 |
      | Monthly  | null  | 2021 |    200 |
      | Yearly   | null  | null |    200 |
      | Weekly   |     7 | 2022 |    400 |
      
