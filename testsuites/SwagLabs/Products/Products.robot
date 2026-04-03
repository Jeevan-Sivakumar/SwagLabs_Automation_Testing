*** Settings ***
Documentation    Swag Labs Product test cases
Library          Browser
Resource         ../../../resources/SwagLabs/Products/tasks.resource
Test Teardown    Close Context

*** Test Cases ***
AIPQA-84 Verify Products page loads correctly
    [Documentation]    Ensure that after login, the Products page loads successfully with all page elements visible.
    [Tags]    SwagLabs    Products    AIPQA-84
    Products Login As Standard User And Navigate To Products Page
    Products Validate Products Page Loads Correctly

AIPQA-86 Verify all products are displayed
    [Documentation]    Verify that exactly six product cards are displayed on the Products page.
    [Tags]    SwagLabs    Products    AIPQA-86
    Products Login As Standard User And Navigate To Products Page
    Products Validate Number Of Products Displayed