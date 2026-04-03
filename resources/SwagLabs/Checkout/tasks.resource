*** Settings ***
Documentation    High-level Checkout task keywords
Resource         ../Login/tasks.resource
Resource         ../Cart/tasks.resource
Resource         ./actions.resource
Variables        ../../../configs/credentials.py

*** Keywords ***
Go To Checkout Information Page
    [Documentation]    Login, add a backpack to cart, open cart, and open Checkout Information page.
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${STANDARD_USER}
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Successful Login

    Click Add To Cart Backpack
    Validate Backpack Button Changed To Remove

    Click Cart Icon
    Validate Cart Page Loaded

    Click Checkout Button
    Validate Checkout Information Page Is Displayed

Enter Checkout Information And Validate
    [Documentation]    Enter checkout information and validate field values.
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}

    Enter First Name    ${first_name}
    Validate First Name Field Value    ${first_name}

    Enter Last Name    ${last_name}
    Validate Last Name Field Value    ${last_name}

    Enter Postal Code    ${postal_code}
    Validate Postal Code Field Value    ${postal_code}

Validate Checkout Result According To Dataset
    [Documentation]    Validate result according to dataset expectation.
    [Arguments]    ${expected_result}

    Click Continue Button

    IF    '${expected_result}' == 'SUCCESS'
        Validate Checkout Overview Page Is Displayed
    ELSE IF    '${expected_result}' == 'ERROR_FIRST_NAME_REQUIRED'
        Validate Checkout Error Message    Error: First Name is required
    ELSE IF    '${expected_result}' == 'ERROR_LAST_NAME_REQUIRED'
        Validate Checkout Error Message    Error: Last Name is required
    ELSE IF    '${expected_result}' == 'ERROR_POSTAL_CODE_REQUIRED'
        Validate Checkout Error Message    Error: Postal Code is required
    ELSE
        Validate Accepted Or Validation Triggered
    END

Go To Checkout Overview Page
    [Documentation]    Navigate successfully from checkout information page to checkout overview page.
    Go To Checkout Information Page
    Enter Checkout Information And Validate    Naim    Ashree    43000
    Click Continue Button
    Validate Checkout Overview Page Is Displayed

Complete Checkout Flow
    [Documentation]    Complete checkout from overview page to complete page.
    Go To Checkout Overview Page
    Click Finish Button
    Validate Checkout Complete Page Is Displayed
    Validate Thank You Message

Cancel From Checkout Information Page
    [Documentation]    Click cancel on checkout information page and return to cart page.
    Go To Checkout Information Page
    Click Cancel Button
    Validate Returned To Cart Page