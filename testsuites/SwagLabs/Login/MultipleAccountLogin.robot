*** Settings ***
Documentation     Data-driven login test cases for AIPQA-154
Library           DataDriver    file=../../../datasets/dataset_AIPQA-154.csv    encoding=utf_8    dialect=excel    delimiter=,
Resource          ../../../resources/SwagLabs/Login/tasks.resource
Test Template     AIPQA-154 Validate Login Functionality With Multiple Credential Combinations
Test Teardown     Close Swag Labs Session

*** Test Cases ***
AIPQA-154 Verify login Functionality With Multiple Credential Combinations
    [Documentation]    Verify login behavior for multiple credential combinations using dataset-driven execution.
    [Tags]    SwagLabs    Login    DataDriven    AIPQA-154
    Default
    

*** Keywords ***
AIPQA-154 Validate Login Functionality With Multiple Credential Combinations
    [Documentation]    Execute login validation for each dataset row and verify the expected outcome.
    [Arguments]    ${username}    ${password}    ${expected_result}

    Open And Validate Swag Labs Login Page

    IF    '${username}' != ''
        Input Username And Validate    ${username}
    ELSE
        Keep Username Blank And Validate
    END

    IF    '${password}' != ''
        Input Password And Validate    ${password}
    ELSE
        Keep Password Blank And Validate
    END

    Submit Login Form

    IF    '${expected_result}' == 'SUCCESS'
        Validate Successful Login
    ELSE IF    '${expected_result}' == 'ERROR_LOCKED'
        Validate Failed Login    Epic sadface: Sorry, this user has been locked out.
    ELSE IF    '${expected_result}' == 'ERROR_INVALID'
        Validate Failed Login    Epic sadface: Username and password do not match any user in this service
    ELSE IF    '${expected_result}' == 'ERROR_EMPTY_USERNAME'
        Validate Failed Login    Epic sadface: Username is required
    ELSE IF    '${expected_result}' == 'ERROR_EMPTY_PASSWORD'
        Validate Failed Login    Epic sadface: Password is required
    END