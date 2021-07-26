Feature: Property Trading Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  
  @TradingList
  Scenario: Once the Trading List api hit then response should be correct
    Given Get all Property Trading API
    When User send Https request "/dev/api/propertytrading/propertytradinglist"
    Then Status_code equals 200

  @AdminList
  Scenario: Once the Admin List api hit then response should be correct
    Given Get all Property Trading API
    When User send Https request "/dev/api/propertytrading/adminlist"
    Then Status_code equals 200

  @TradingPropertyDetails
  Scenario Outline: Once the Property details api hit then response should be correct
    Given Get all Property Trading API
    When User send Https request "/dev/api/propertytrading/propertydetails/<propertyId>"
    Then Status_code equals <status>

    Examples: 
      | propertyId | status |
      |          4 |    200 |
      |          6 |    200 |

  @ManageTransactionDetails
  Scenario Outline: Once the Manage Transaction api hit then response should be correct
    Given Get all Property Trading API
    When User send Https request "/dev/api/propertytrading/managetransaction/<propertyTransId>"
    Then Status_code equals <status>

    Examples: 
      | propertyTransId | status |
      |             118 |    200 |
      |             119 |    200 |
      |            1000 |    400 |

  @UpdateAssigneeName
  Scenario Outline: Once the Update assignee name updated then response should be correct
    Given Get all Property Trading API
    When User PUT request "{\"propertyTransId\":<propertyTransId>,\"assignedUserId\":<assignedUserId>}" and send HTTPs request "/dev/api/propertytrading/adminlist"
    Then Status_code equals <status>

    Examples: 
      | propertyTransId | assignedUserId | status |
      |             118 |              8 |    200 |
      |             118 |              6 |    200 |
      |               0 |              8 |    400 |
      |             121 |              8 |    200 |
