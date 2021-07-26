Feature: Wallet Administration Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  @GetallAdminRequest
  Scenario: Once the get all request api hit then response should be correct
    Given Get wallet administration API
    When send get Https request "/Dev/api/wallet/admin/"
    Then Status_code equals 200

  @SearchCustomerName
  Scenario Outline: Once the get search by customer name api hit then response should be correct
    Given Get wallet administration API
    When send get Https request "/Dev/api/wallet/admin/<customerName>"
    Then Status_code equals <status>

    Examples: 
      | customerName | status |
      | Ammarah      |    200 |
      | Aniket       |    200 |
      | Mayur        |    200 |
      | Amit         |    200 |
      | abcs         |    400 |

  @UserBankDetails
  Scenario Outline: Once the user bank details api hit then response should be correct
    Given Post wallet administration API
    When User send post request "{\"accountNumber\":\"<accountNumber>\",\"emailId\":\"<emailId>\"}" and Https request "/Dev/api/wallet/admin/getUserBankDetails"
    Then Status_code equals <status>

    Examples: 
      | accountNumber   | emailId                    | status |
      | 000100289877623 | ammarah@transformhub.com   |    200 |
      |       454654654 | test@gmail.com             |    400 |
      |       454654654 | amit.tallewar200@gmail.com |    200 |

  @Deposit
  Scenario Outline: Once the deposit api hit then response should be correct
    Given Post wallet administration API
    When User send post request "{\"emailId\":\"<emailId>\",\"depositAmount\" :\"<depositAmount>\"}" and Https request "/Dev/api/wallet/admin/depositMoney"
    Then Status_code equals <status>

    Examples: 
      | emailId                  | depositAmount | status |
      | ammarah@transformhub.com |            10 |    200 |
      | Amit@transformhub.com    |            10 |    400 |

  @Withdraw
  Scenario Outline: Once the deposit api hit then response should be correct
    Given Post wallet administration API
    When User send post request "{\"walletLedgerId\":\"<walletLedgerId>\",\"amount\" :\"<amount>\"}" and Https request "/Dev/api/wallet/admin/withDrawMoney"
    Then Status_code equals <status>

    Examples: 
      | walletLedgerId | amount | status |
      |            821 |     10 |    200 |
      |            835 |     10 |    200 |
      |           1000 |     20 |    200 |
      |          15000 |      2 |    400 |

  @CanelWithdraw
  Scenario Outline: Once the deposit api hit then response should be correct
    Given Post wallet administration API
    When User send put request "{\"walletLedgerId\":\"<walletLedgerId>\"}" and Https request "/Dev/api/wallet/admin/cancelWithdraw"
    Then Status_code equals <status>

    Examples: 
      | walletLedgerId | status |
      |            821 |    200 |
      |            835 |    200 |
      |           1000 |    200 |
      |          15000 |    400 |
