*** Settings ***
Documentation     Swag Labs Cart test cases
Resource          ../../../resources/SwagLabs/Cart/tasks.resource
#Test Teardown     Close Swag Labs Session

*** Test Cases ***

AIPQA-87 Verify adding a product to cart
    [Documentation]    Verify user can add a product and it reflects in cart.
    [Tags]    SwagLabs    Cart    AIPQA-87
    Login As Standard User And Navigate To Products
    Add Backpack To Cart And Validate
    Open Cart And Validate Backpack

AIPQA-88 Verify removing product from cart
    [Documentation]    Verify product can be removed from cart successfully.
    [Tags]    SwagLabs    Cart    AIPQA-88
    Login As Standard User And Navigate To Products
    Add Backpack To Cart And Validate
    Open Cart And Validate Backpack
    Remove Backpack And Validate

AIPQA-112 Verify cart badge updates
    [Documentation]    Verify cart badge updates correctly when item is added.
    [Tags]    SwagLabs    Cart    AIPQA-112
    Login As Standard User And Navigate To Products
    Validate Cart Badge Not Present
    Add Backpack To Cart And Validate

AIPQA-141 Verify multiple products can be added
    [Documentation]    Verify multiple products can be added and reflected correctly.
    [Tags]    SwagLabs    Cart    AIPQA-141
    Login As Standard User And Navigate To Products
    Add Backpack To Cart And Validate
    Add Bike Light To Cart And Validate
    Validate Cart Badge Count    2

AIPQA-142 Verify cart page displays correct products
    [Documentation]    Verify correct products are displayed in cart.
    [Tags]    SwagLabs    Cart    AIPQA-142
    Login As Standard User And Navigate To Products
    Add Backpack To Cart And Validate
    Add Bike Light To Cart And Validate
    Click Cart Icon
    Validate Cart Page Loaded
    Validate Product Present In Cart    Sauce Labs Backpack
    Validate Product Present In Cart    Sauce Labs Bike Light

AIPQA-143 Verify cart retains items after refresh
    [Documentation]    Verify cart items persist after page refresh.
    [Tags]    SwagLabs    Cart    AIPQA-143
    Login As Standard User And Navigate To Products
    Add Backpack To Cart And Validate
    Validate Cart Badge Count    1
    Refresh Page
    Validate Cart Badge Count    1
    Click Cart Icon
    Validate Product Present In Cart    Sauce Labs Backpack