*** Settings ***
Documentation    Low-level action keywords for Swag Labs Login
Library          Browser
Variables        ../../../configs/dev.py
Variables        ./page.py

*** Keywords ***
Open Swag Labs Login Page
    [Documentation]    Launch browser, open the Swag Labs login page, and create browser context.
    New Browser    browser=${BROWSER_TYPE}    headless=${BROWSER_HEADLESS}     slowMo=1s
    New Context
    New Page    ${LOGIN_PAGE_URL}

    
Validate Login Page Is Displayed
    [Documentation]    Verify that the Swag Labs login page is loaded and all required login fields are visible.
    Wait For Elements State    ${username_input}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${password_input}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${login_button}      visible    timeout=${DEFAULT_TIMEOUT}
    ${current_url}=    Get Url
    Should Contain    ${current_url}    saucedemo.com

Enter Username
    [Documentation]    Populate the username field with the provided username.
    [Arguments]    ${username}
    Fill Text    ${username_input}    ${username}

Validate Username Is Entered
    [Documentation]    Verify that the username field contains the expected username value.
    [Arguments]    ${expected_username}
    ${actual_username}=    Get Attribute    ${username_input}    value
    Should Be Equal As Strings    ${actual_username}    ${expected_username}

Enter Password
    [Documentation]    Populate the password field with the provided password.
    [Arguments]    ${password}
    Fill Text    ${password_input}    ${password}

Validate Password Is Entered
    [Documentation]    Verify that the password field contains the expected password value.
    [Arguments]    ${expected_password}
    ${actual_password}=    Get Attribute    ${password_input}    value
    Should Be Equal As Strings    ${actual_password}    ${expected_password}

Leave Username Blank
    [Documentation]    Clear the username field so that it remains empty.
    Clear Text    ${username_input}

Validate Username Is Blank
    [Documentation]    Verify that the username field is empty.
    ${actual_username}=    Get Attribute    ${username_input}    value
    Should Be Equal As Strings    ${actual_username}    ${EMPTY}

Leave Password Blank
    [Documentation]    Clear the password field so that it remains empty.
    Clear Text    ${password_input}

Validate Password Is Blank
    [Documentation]    Verify that the password field is empty.
    ${actual_password}=    Get Attribute    ${password_input}    value
    Should Be Equal As Strings    ${actual_password}    ${EMPTY}

Click Login Button
    [Documentation]    Click the Login button to submit the login form.
    Click    ${login_button}

Validate Products Page Is Displayed
    [Documentation]    Verify that the inventory page is displayed after a successful login.
    Wait For Elements State    ${app_logo}    visible    timeout=${DEFAULT_TIMEOUT}
    ${current_url}=    Get Url
    Should Contain    ${current_url}    inventory

Validate Login Error Message Is Displayed
    [Documentation]    Verify that the expected login error message is displayed.
    [Arguments]    ${expected_message}
    Wait For Elements State    ${error_message_box}    visible    timeout=${DEFAULT_TIMEOUT}
    ${actual_message}=    Get Text    ${error_message_box}
    Should Be Equal As Strings    ${actual_message}    ${expected_message}

Validate Error Message Box Is Displayed Correctly
    [Documentation]    Verify that the red login error message box is displayed correctly above the Login button.
    Wait For Elements State    ${error_message_box}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${login_button}         visible    timeout=${DEFAULT_TIMEOUT}

Close Swag Labs Session
    [Documentation]    Close the active browser session.
    Close Browser