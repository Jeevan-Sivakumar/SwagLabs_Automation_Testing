*** Settings ***
Documentation    High-level task keywords for Swag Labs Login
Resource         ./actions.resource
Variables        ../../../configs/credentials.py

*** Keywords ***
Open And Validate Swag Labs Login Page
    Open Swag Labs Login Page
    Validate Login Page Is Displayed

Input Username And Validate
    [Arguments]    ${username}
    Enter Username    ${username}
    Validate Username Is Entered    ${username}

Input Password And Validate
    [Arguments]    ${password}
    Enter Password    ${password}
    Validate Password Is Entered    ${password}

Keep Username Blank And Validate
    Leave Username Blank
    Validate Username Is Blank

Keep Password Blank And Validate
    Leave Password Blank
    Validate Password Is Blank

Submit Login Form
    Click Login Button

Validate Successful Login
    Validate Products Page Is Displayed

Validate Failed Login
    [Arguments]    ${expected_error}
    Validate Login Error Message Is Displayed    ${expected_error}
    Validate Error Message Box Is Displayed Correctly  