Feature: Document Generation and eSignature Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  @FetchAllActiveDoc
  Scenario Outline: Once the fetch all active document api hit then response should be correct
    Given Get document managemnet API
    When send get request "/Dev/documentManagement/api/v1.0/documents/all/properties/<propertyId>"
    Then Status_code equals <status>

    Examples: 
      | propertyId | status |
      |         14 |    200 |
      |         12 |    200 |

  @GetDownloadLink
  Scenario: Once the get download link document api hit then response should be correct
    Given Get document managemnet API
    When send get request "/Dev/documentManagement/api/v1.0/documents/signNow/5dae9d74d4d74d9dbe53f21e716f35abdae241a8/download"
    Then Status_code equals 200
    
    @signAll 
  Scenario Outline: Once the sign all active document api hit then response should be correct
    Given Post document managemnet API
    When send post body request "{\"propertyId\": \"<propertyId>\"}" and https request "/Dev/documentManagement/api/v1.0/documents/signature"
    Then Status_code equals <status>

    Examples: 
      | propertyId | status |
      |         14 |    200 |
      |         12 |    400 |
      
    @UploadDocuments 
  Scenario: Once the upload document api hit then response should be correct
    Given Post Upload Document API
    When user send request
    Then Status_code equals 200
      

 