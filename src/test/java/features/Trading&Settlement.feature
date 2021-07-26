Feature: Trading and Sattlement Collection

  #Background: 
    #Given Post Login API
    #When Provide Valid Credential
    #Then Status_code equals 200
    #And response contains IsLogin equals "User signin successfull, please verify OTP"
    #When User Verify the OTP
    #Then Extract the token
    #And User is authorized

  @CashYield
  Scenario: Once the Cash Yield api hit then response should be correct
    Given Post cash yield API
    When User send Post Body "{\"purchasePrice\": 100,\"transactionType\": \"Term Deposit\",\"duration\": 12}" and send Https request "/Dev/tradingsettlement/api/v1.0/funds/yieldcash"
    Then Status_code equals 200
    
  

  @SaveTransaction
  Scenario: Once the Save Transaction api hit then response should be correct
    Given Post cash yield API
    When User send Post Body "{\"purchasePrice\": 100,\"transactionType\": \"Term Deposit\",\"duration\": 12, \"cashYield\":0.50}" and send Https request "/Dev/tradingsettlement/api/v1.0/funds/transactions"
    Then Status_code equals 200
    
  @FundAvailability
  Scenario: Once the fund availability api hit then response should be correct
    Given Post cash yield API
    When User send Post Body "{\"purchasePrice\": 100}" and send Https request "/Dev/tradingsettlement/api/v1.0/funds/availability"
    Then Status_code equals 200  
    
    @GetAllTransactionTypeDetails
  Scenario: Once the Get all transaction type detail api hit then response should be correct
    Given Get Trading and Sattlement API
    When User sends Get Https request "/Dev/tradingsettlement/api/v1.0/funds/investmenttype"
    Then Status_code equals 200
    
    @GetAllProcessTransaction
  Scenario: Once the Get All Process Transaction api hit then response should be correct
    Given Get Trading and Sattlement API
    When User sends Get Https request "/Dev/tradingsettlement/api/v1.0/funds/investmenttype"
    Then Status_code equals 200
    
    @AcceptTransaction
  Scenario: Once the Accept Transaction api hit then response should be correct
    Given Put Trading and Sattlement API
  	When User sends Put Https request "Dev/tradingsettlement/api/v1.0/funds/investment/185/accept"
    Then Status_code equals 202
    
     @GetAcceptedInvested
  Scenario: Once the Save Transaction api hit then response should be correct
    Given Get Trading and Sattlement API
    When User sends Get Https request "/Dev/tradingsettlement/api/v1.0/funds/investments/user/185"
    Then Status_code equals 200
    
       @GetAllInvestments
  Scenario: Once the Save Transaction api hit then response should be correct
    Given Get Trading and Sattlement API
    When User sends Get Https request "/Dev/tradingsettlement/api/v1.0/funds/investments"
    Then Status_code equals 200

 