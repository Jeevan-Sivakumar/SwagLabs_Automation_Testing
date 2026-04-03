*** Settings ***
Documentation    Product task-level keywords
Resource         ../Login/tasks.resource
Resource         ./actions.resource
Variables        ../../../configs/credentials.py

*** Keywords ***
Products Login As Standard User And Navigate To Products Page
    [Documentation]    Log in as standard user and verify successful navigation to the Products page.
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${STANDARD_USER}
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Successful Login

Products Validate Products Page Loads Correctly
    [Documentation]    Verify that the Products page loads correctly after successful login.
    Validate Products Page Header
    Validate All Product Cards Are Visible

Products Validate Number Of Products Displayed
    [Documentation]    Verify that exactly six products are displayed on the Products page.
    Validate Product Count Is Six

Products Validate Product Details From Dataset
    [Documentation]    Verify product name, description, price, and Add to Cart button from dataset on the Products page.
    [Arguments]    ${Product_Name}    ${Description}    ${Price}
    Products Login As Standard User And Navigate To Products Page
    Validate Product Exists On List Page    ${Product_Name}    ${Description}    ${Price}
    Validate Add To Cart Button Is Visible For Product    ${Product_Name}

Products Validate Product Details Page From Dataset
    [Documentation]    Verify navigation to product details page and validate product details against dataset.
    [Arguments]    ${Product_Name}    ${Description}    ${Price}
    Products Login As Standard User And Navigate To Products Page
    Open Product Details Page From Product Name    ${Product_Name}
    Validate Product Details Page Is Loaded
    Validate Product Details Page Content    ${Product_Name}    ${Description}    ${Price}
    Validate Add To Cart Button Is Visible On Details Page

Verify Product Details Displayed Correctly From Dataset
    [Documentation]    Template keyword for AIPQA-111 data-driven product list validation.
    [Arguments]    ${Product_Name}    ${Description}    ${Price}
    Products Validate Product Details From Dataset    ${Product_Name}    ${Description}    ${Price}

Verify User Can Open Product Details Page
    [Documentation]    Template keyword for AIPQA-138 data-driven product details page validation.
    [Arguments]    ${Product_Name}    ${Description}    ${Price}
    Products Validate Product Details Page From Dataset    ${Product_Name}    ${Description}    ${Price}