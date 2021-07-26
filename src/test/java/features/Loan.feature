Feature: Loan Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  @DoYieldCalcultor
  Scenario Outline: Once the post yield calculator api hit then response should be correct
    Given post the loan API
    When send the body "{\"propertyPrice\":<propertyPrice>,\"depositAmount\":<depositAmount>,\"leaseRate\":<leaseRate>}" and Https request "/Dev/api/loans/getyieldcalculator"
    Then Status_code equals <status>

    Examples: 
      | propertyPrice | depositAmount | leaseRate | status |
      |        544500 |        500000 |         6 |    200 |
      |         10000 |        300000 |         6 |    200 |

  @DoPropertyTransaction
  Scenario Outline: Once the post property transaction api hit then response should be correct
    Given post the loan API
    When send the body "{\"propertyTransId\":<propertyTransId> ,\"propertyPrice\": <propertyPrice>,\"depositRate\": <depositRate>,\"feeTaxesRate\": <feeTaxesRate>,\"financeRate\": <financeRate>,\"leaseRate\": <leaseRate>,\"propertyId\": <propertyId>}" and Https request "/Dev/api/loans/dopropertyloantransaction"
    Then Status_code equals 200
      | propertyTransId | propertyPrice | depositRate | feeTaxesRate | financeRate | leaseRate | propertyId | status |
      |             118 |        495000 |          12 |           15 |           3 |         6 |          4 |    200 |
      |             118 |        495000 |          12 |           15 |           3 |         6 |          4 |    200 |

  @LoanPaymentSummary
  Scenario Outline: Once the post loan summary api hit then response should be correct
    Given post the loan API
    When send the body "{\"loanPaymentId\":<loanPaymentId>,\"propertyTransId\":<propertyTransId>}" and Https request "/Dev/api/loans/getLoanPaymentSummary"
    Then Status_code equals <status>

    Examples: 
      | loanPaymentId | propertyTransId | status |
      |            32 |             118 |    200 |
      |            34 |             185 |    200 |

  @LoanDue
  Scenario Outline: Once the post Loan due detailsa api hit then response should be correct
    Given post the loan API
    When send the body "{\"userId\":<userId>}" and Https request "/Dev/api/loans/getloanduedetails"
    Then Status_code equals <status>

    Examples: 
      | userId | status |
      |      1 |    200 |
      |    185 |    200 |
      |    118 |    200 |
      |  15000 |    400 |

  @GetPropertyInfo
  Scenario Outline: Once the post Property info api hit then response should be correct
    Given post the loan API
    When send the body "{\"propertyTransId\":<propertyTransId>}" and Https request "/Dev/api/loans/getpropertiestransinfo"
    Then Status_code equals <status>

    Examples: 
      | propertyTransId | status |
      |             124 |    400 |
      |             125 |    200 |
      |             128 |    400 |
      |           15000 |    400 |

  @MakePrincipalPayment
  Scenario Outline: Once the Make Principal Payment api hit then response should be correct
    Given post the loan API
    When send the body "{\"userId\": <userId>,\"loanAccountNumber\": <loanAccountNumber>,\"payingPrincipalAmount\":<payingPrincipalAmount>}" and Https request "/Dev/api/loans/makeprincipalpayment"
    Then Status_code equals <status>

    Examples: 
      | userId | loanAccountNumber | payingPrincipalAmount | status |
      |    186 |            945252 |                    19 |    200 |
      |    185 |            945252 |                    19 |    200 |
