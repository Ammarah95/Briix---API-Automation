Feature: Profile Management Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  @ProfileManagement
  Scenario: Once the profile management api hit then response should be correct
    Given Get Profile Management API
    When User send request "/api/userprofiles/userbanks/"
    Then Status_code equals 200
    
 @GetProfile
  Scenario: Once the get user profile api hit then response should be correct
    Given Get Profile Management API
    When User send request "/api/userprofiles/getprofile"
    Then Status_code equals 200

  @BankDetailsAsString
  Scenario Outline: Once the search bank by string api hit then response should be correct
    Given Get Profile Management API
    When User send request body "{\"searchString\":\"<searchString>\"}" and send request URL "/api/userprofiles/userbanks/searchbank"
    Then Status_code equals <status>

    Examples: 
      | searchString | status |
      | A            |    200 |
      | S            |    200 |

  @BankDetailsbyid
  Scenario Outline: Once the Bank id api hit then response should be correct
    Given Get Profile Management API
    When User send request body "{\"bankId\":<bankId>}" and send request URL "/api/userprofiles/userbanks/getbankonid"
    Then Status_code equals <status>

    Examples: 
      | bankId | status |
      |    102 |    200 |
      |    101 |    200 |
      |    500 |    204 |
