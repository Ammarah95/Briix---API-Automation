Feature: Authentication Process

  @validLogin
  Scenario: User Should Login With Valid Credentials
    Given Post Login API
    When Provide Valid Credential
    Then Status_code equals 200
    And response contains IsLogin equals "User signin successfull, please verify OTP"
    When User Verify the OTP 

  @invalidLogin
  Scenario Outline: Email and Password Validation in Login API
    Given Post Login API
    When Provide different combinations to "<email>" "<password>"
    Then Status_code equals <statuscode>
    And response contains message equals "<message>"

    Examples: 
      | email        | password | statuscode | message                                  |
      |              |          |        400 | Required email and password              |
      | abc          |   123333 |        400 | Email format is incorrect                |
      | abc@mail7.io |          |        400 | Required password                        |
      | abc@mail7.io | password |        400 | Email and Password combination Incorrect |
