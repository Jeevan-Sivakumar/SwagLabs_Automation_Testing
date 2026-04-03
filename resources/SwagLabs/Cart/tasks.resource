*** Settings ***
Documentation    Cart task-level keywords
Resource         ../Login/tasks.resource
Resource         ./actions.resource
Variables        ../../../configs/credentials.py

*** Keywords ***
Login As Standard User And Navigate To Products
    Open And Validate Swag Labs Login Page
    Input Username And Validate    ${STANDARD_USER}
    Input Password And Validate    ${VALID_PASSWORD}
    Submit Login Form
    Validate Successful Login

Add Backpack To Cart And Validate
    Click Add To Cart Backpack
    Validate Backpack Button Changed To Remove
    Validate Cart Badge Count    1

Add Bike Light To Cart And Validate
    Click Add To Cart Bike Light
    Validate Bike Light Button Changed To Remove

Open Cart And Validate Backpack
    Click Cart Icon
    Validate Cart Page Loaded
    Validate Product Present In Cart    Sauce Labs Backpack
    Validate Cart Item Quantity Is 1

Remove Backpack And Validate
    Click Remove Backpack
    Validate Product Removed From Cart    Sauce Labs Backpack