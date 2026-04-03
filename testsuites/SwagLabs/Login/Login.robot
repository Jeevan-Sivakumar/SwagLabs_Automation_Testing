*** Settings ***
Documentation     Swag Labs login test cases
Resource          ../../../resources/SwagLabs/Login/tasks.resource
Variables         ../../../configs/credentials.py
Test Teardown     Close Swag Labs Session

*** Test Cases ***
AIPQA-80 Verify login with valid credentials
    [Documentation]    Verify that a valid user can log in successfully and is redirected to the products page.
    [Tags]    SwagLabs    Login    Positive    AIPQA-80
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${STANDARD_USER}
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Successful Login

AIPQA-82 Verify login with Locked Out User
    [Documentation]    Verify that a locked out user cannot log in and the correct error message is displayed.
    [Tags]    SwagLabs    Login    Negative    AIPQA-82
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${LOCKED_USER}
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Failed Login    Epic sadface: Sorry, this user has been locked out.

AIPQA-83 Verify login with valid username and wrong password
    [Documentation]    Verify that login fails when a valid username and an invalid password are entered.
    [Tags]    SwagLabs    Login    Negative    AIPQA-83
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${STANDARD_USER}
    Input Password And Validate    ${WRONG_PASSWORD}
    Submit Login Form
    Validate Failed Login    Epic sadface: Username and password do not match any user in this service

AIPQA-110 Verify login with invalid username and correct password
    [Documentation]    Verify that login fails when an invalid username and a valid password are entered.
    [Tags]    SwagLabs    Login    Negative    AIPQA-110
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${INVALID_USER}
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Failed Login    Epic sadface: Username and password do not match any user in this service

AIPQA-135 Verify login with invalid username and wrong password
    [Documentation]    Verify that login fails when both username and password are invalid.
    [Tags]    SwagLabs    Login    Negative    AIPQA-135
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${INVALID_USER}
    Input Password And Validate    ${WRONG_PASSWORD}
    Submit Login Form
    Validate Failed Login    Epic sadface: Username and password do not match any user in this service

AIPQA-136 Verify login with empty username
    [Documentation]    Verify that login fails when username is left blank and password is entered.
    [Tags]    SwagLabs    Login    Negative    AIPQA-136
    Open And Validate Swag Labs Login Page
    Keep Username Blank And Validate
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Failed Login    Epic sadface: Username is required

AIPQA-137 Verify login with empty password
    [Documentation]    Verify that login fails when password is left blank and username is entered.
    [Tags]    SwagLabs    Login    Negative    AIPQA-137
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${STANDARD_USER}
    Keep Password Blank And Validate
    Submit Login Form
    Validate Failed Login    Epic sadface: Password is required