Feature: Wallet Transaction Collection

  #Background: 
    #Given Post Login API
    #When Provide Valid Credential
    #Then Status_code equals 200
    #And response contains IsLogin equals "User signin successfull, please verify OTP"
    #When User Verify the OTP
    #Then Extract the token
    #And User is authorized

  @WalletPingAPI
  Scenario: Once the ping api hit then response should be correct
    Given Get API
    When User send Get Https request "/Dev/walletservice/api/v1.0/ping"
    Then Status_code equals 200

  @WalletDBHealthAPI
  Scenario: Once the dbhealth api hit then response should be correct
    Given Get API
    When User send Get Https request "/Dev/walletservice/api/v1.0/dbhealth"
    Then Status_code equals 200

  @WalletCashDeductionAPI
  Scenario Outline: Once the cashdeduction api hit then response should be correct
    Given POST API
    When User send Post body "{\"amount\":<amount>, \"transactionType\":\"<transactionType>\",\"userId\":<userId>,\"scheduler\":<scheduler>,\"transactionDesc\": \"<transactionDesc>\"}" and Https request "/Dev/walletservice/api/v1.0/cashdeduction"
    Then Status_code equals <status>

    Examples: 
      | amount | transactionType  | userId | scheduler | transactionDesc  | status |
      |    100 | Investment       |    186 | false     | Deduction        |    200 |
      |  10000 | Investment       |    212 | false     | Investment       |    400 |
      |     10 | Funds Transfer   |    186 | false     | Funds Transfer   |    200 |
      |     10 | Maturity         |    186 | false     | Maturity         |    200 |
      |     10 | Loan Repayment   |    186 | false     | Loan Repayment   |    200 |
      |     10 | Withdrawal       |    186 | false     | Withdrawal       |    200 |
      |     10 | Deposit          |    186 | false     | Deposit          |    200 |
      |     10 | Monthly Coupon   |    186 | false     | Monthly Coupon   |    200 |
      |     10 | Loan Repayment   |    186 | false     | Loan Repayment   |    200 |
      |     10 | Lease Income     |    186 | false     | Lease Income     |    200 |
      |     10 | Principal Amount |    186 | false     | Principal Amount |    200 |

  @WalletGetAllUsersTransaction
  Scenario Outline: Once the User Transaction api hit then response should be correct
    Given Get API
    When User send Get Https request "/Dev/walletservice/api/v1.0/transactions?pageNo=<PageNumber>&pageSize=<PageSize>&fromDate=<Fromdate>&toDate=<Todate>"
    Then Status_code equals <status>

    Examples: 
      | PageNumber | PageSize | Fromdate   | Todate     | status |
      |          0 |       20 | 2021-06-15 | 2021-07-02 |    200 |
      |          1 |      100 | 2021-06-20 | 2021-07-01 |    200 |
