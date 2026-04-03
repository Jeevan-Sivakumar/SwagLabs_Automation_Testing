*** Settings ***
Documentation    Low-level Checkout actions
Library          Browser
Variables        ../../../configs/dev.py
Variables        ./page.py

*** Keywords ***
Validate Checkout Information Page Is Displayed
    [Documentation]    Verify that Checkout: Your Information page is displayed.
    Wait For Elements State    ${checkout_information_title}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${first_name_input}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${last_name_input}     visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${postal_code_input}   visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${continue_button}     visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${cancel_button}       visible    timeout=${DEFAULT_TIMEOUT}

Enter First Name
    [Documentation]    Enter first name.
    [Arguments]    ${first_name}
    Fill Text    ${first_name_input}    ${first_name}

Enter Last Name
    [Documentation]    Enter last name.
    [Arguments]    ${last_name}
    Fill Text    ${last_name_input}    ${last_name}

Enter Postal Code
    [Documentation]    Enter postal code.
    [Arguments]    ${postal_code}
    Fill Text    ${postal_code_input}    ${postal_code}

Validate First Name Field Value
    [Documentation]    Verify first name field value.
    [Arguments]    ${expected}
    ${actual}=    Get Attribute    ${first_name_input}    value
    Should Be Equal As Strings    ${actual}    ${expected}

Validate Last Name Field Value
    [Documentation]    Verify last name field value.
    [Arguments]    ${expected}
    ${actual}=    Get Attribute    ${last_name_input}    value
    Should Be Equal As Strings    ${actual}    ${expected}

Validate Postal Code Field Value
    [Documentation]    Verify postal code field value.
    [Arguments]    ${expected}
    ${actual}=    Get Attribute    ${postal_code_input}    value
    Should Be Equal As Strings    ${actual}    ${expected}

Click Continue Button
    [Documentation]    Click Continue button.
    Click    ${continue_button}

Click Cancel Button
    [Documentation]    Click Cancel button.
    Click    ${cancel_button}

Click Checkout Button
    [Documentation]    Click Checkout button from cart page.
    Click    ${checkout_button}

Click Finish Button
    [Documentation]    Click Finish button on checkout overview page.
    Click    ${finish_button}

Click Back Home Button
    [Documentation]    Click Back Home button on checkout complete page.
    Click    ${back_home_button}

Validate Checkout Overview Page Is Displayed
    [Documentation]    Verify that Checkout: Overview page is displayed.
    Wait For Elements State    ${checkout_overview_title}    visible    timeout=${DEFAULT_TIMEOUT}

Validate Checkout Error Message
    [Documentation]    Verify checkout error message is displayed correctly.
    [Arguments]    ${expected_message}
    Wait For Elements State    ${error_message_box}    visible    timeout=${DEFAULT_TIMEOUT}
    ${actual}=    Get Text    ${error_message_box}
    Should Be Equal As Strings    ${actual}    ${expected_message}

Validate Accepted Or Validation Triggered
    [Documentation]    Verify that the app either proceeds or shows a validation error.
    ${success}=    Run Keyword And Return Status    Wait For Elements State    ${checkout_overview_title}    visible    timeout=5s
    ${error}=      Run Keyword And Return Status    Wait For Elements State    ${error_message_box}    visible    timeout=2s
    ${result}=     Evaluate    $success or $error
    Should Be Equal    ${result}    ${True}

Validate Returned To Cart Page
    [Documentation]    Verify user is returned to cart page.
    Wait For Elements State    ${cart_page_title}    visible    timeout=${DEFAULT_TIMEOUT}

Validate Checkout Complete Page Is Displayed
    [Documentation]    Verify checkout complete page is displayed.
    Wait For Elements State    ${checkout_complete_title}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${thank_you_message}        visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${back_home_button}         visible    timeout=${DEFAULT_TIMEOUT}

Validate Thank You Message
    [Documentation]    Verify the thank you message text is visible.
    ${text}=    Get Text    ${thank_you_message}
    Should Be Equal As Strings    ${text}    Thank you for your order!