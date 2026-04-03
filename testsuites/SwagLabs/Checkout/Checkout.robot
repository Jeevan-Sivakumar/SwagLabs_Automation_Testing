*** Settings ***
Documentation     Swag Labs Checkout Test Cases
Resource          ../../../resources/SwagLabs/Checkout/tasks.resource
Test Teardown     Close Swag Labs Session

*** Test Cases ***

AIPQA-90 Verify User Can Proceed To Checkout
    [Tags]    Checkout    AIPQA-90
    Go To Checkout Information Page



AIPQA-92 Verify Checkout Overview Page
    [Tags]    Checkout    AIPQA-92

    Go To Checkout Information Page
    Enter Checkout Information And Validate    Naim    Ashree    43000
    Click Continue Button

    Validate Checkout Overview Page Is Displayed



AIPQA-113 Verify Finish Checkout
    [Tags]    Checkout    AIPQA-113

    Go To Checkout Information Page
    Enter Checkout Information And Validate    Naim    Ashree    43000
    Click Continue Button

    Click    id=finish
    Wait For Elements State    text=Checkout: Complete!    visible

    Get Text    text=Thank you for your order!
    Click    id=back-to-products



AIPQA-144 Verify Cancel From Checkout Information
    [Tags]    Checkout    AIPQA-144

    Go To Checkout Information Page

    Click    id=cancel
    Wait For Elements State    text=Your Cart    visible