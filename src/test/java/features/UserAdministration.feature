Feature: User Administration Collection

  #Background:
  #Given Post Login API
  #When Provide Valid Credential
  #Then Status_code equals 200
  #And response contains IsLogin equals "User signin successfull, please verify OTP"
  #When User Verify the OTP
  #Then Extract the token
  #And User is authorized
  @GetAllCustomers
  Scenario: Once the All Customers api hit then response should be correct
    Given Get all User Administration API
    When User send Get request "/dev/api/customer"
    Then Status_code equals 200

  @CustomerById
  Scenario Outline: Verify the response by using customer id
    Given Get all User Administration API
    When User send Get request "/dev/api/customer/<customerId>"
    Then Status_code equals <status>

    Examples: 
      | customerId | status |
      |        212 |    400 |
      |        230 |    200 |
      |       1000 |    400 |

  @GetAllAdmins
  Scenario: Once the All Admin api hit then response should be correct
    Given Get all User Administration API
    When User send Get request "/dev/api/admin"
    Then Status_code equals 200

  @UpdateApi
  Scenario Outline: Once the update api hit then response should be correct and data should be update
    Given Put update customer details API
    When User send PUT request "{\"firstName\":\"<firstName>\",\"lastName\":\"<lastName>\",\"emailId\":\"<emailId>\",\"phoneCode\":\"<phoneCode>\",\"mobileNumber\":\"<mobileNumber>\",\"bankId\":<bankId>,\"bankAccountNumber\":\"<AccNo>\"}" and send HTTPs request "/dev/api/customer/<CustomerId>"
    Then Status_code equals <status>

    Examples: 
      | CustomerId | firstName | lastName | emailId                  | phoneCode | mobileNumber | bankId | AccNo   | status |
      |        250 | Aliza     | Ayubi    | ammarahayubi95@gmail.com | +91       |   9082884528 |    101 | 4223432 |    202 |
      |        600 | Aleeza    | Ayubi    | ammarahayubi95@gmail.com | +91       |   9082884528 |    101 | 4223432 |    400 |

  @UpdateStatus
  Scenario Outline: Once the update status then response should be correct and data should be update
    Given Put update customer details API
    When User send PUT request "{\"emailId\":\"<emailId>\",\"status\":\"<statusUpdate>\"}" and send HTTPs request "dev/api/user/status"
    Then Status_code equals <status>

    Examples: 
      | emailId                  | statusUpdate | status |
      | ammarahayubi95@gmail.com | I            |    202 |
      | ammarahayubi95@gmail.com | A            |    202 |
      | ammarah@Transformhub.com | A            |    202 |
      | xyz@Transformhub.com     | A            |    400 |
