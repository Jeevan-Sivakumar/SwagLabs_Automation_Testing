*** Settings ***
Documentation    Low-level Cart actions
Library          Browser
Variables        ../../../configs/dev.py
Variables        ./page.py

*** Keywords ***
Click Add To Cart Backpack
    Click    ${add_to_cart_backpack}

Validate Backpack Button Changed To Remove
    Wait For Elements State    ${remove_backpack}    visible

Click Remove Backpack
    [Documentation]    Click the Remove button for Sauce Labs Backpack.
    Click    ${remove_backpack}

Click Add To Cart Bike Light
    Click    ${add_to_cart_bike_light}

Validate Bike Light Button Changed To Remove
    Wait For Elements State    ${remove_bike_light}    visible

Click Cart Icon
    Click    ${cart_icon}

Validate Cart Page Loaded
    Wait For Elements State    ${cart_container}    visible

Validate Cart Badge Count
    [Documentation]    Verify that the cart badge shows the expected count.
    [Arguments]    ${expected_count}
    ${actual}=    Get Text    ${cart_badge}
    Should Be Equal As Strings    ${actual}    ${expected_count}

Validate Cart Badge Not Present
    [Documentation]    Verify that the cart badge is not displayed when cart is empty.
    ${count}=    Get Element Count    ${cart_badge}
    Should Be Equal As Integers    ${count}    0

Validate Product Present In Cart
    [Documentation]    Verify that the specified product is displayed in the cart.
    [Arguments]    ${product_name}
    ${items}=    Get Elements    ${cart_item_name}
    ${found}=    Set Variable    ${False}
    FOR    ${item}    IN    @{items}
        ${text}=    Get Text    ${item}
        IF    '${text}' == '${product_name}'
            ${found}=    Set Variable    ${True}
            BREAK
        END
    END
    Should Be True    ${found}

Validate Product Removed From Cart
    [Documentation]    Verify that the specified product is no longer displayed in the cart.
    [Arguments]    ${product_name}
    ${items}=    Get Elements    ${cart_item_name}
    ${found}=    Set Variable    ${False}
    FOR    ${item}    IN    @{items}
        ${text}=    Get Text    ${item}
        IF    '${text}' == '${product_name}'
            ${found}=    Set Variable    ${True}
            BREAK
        END
    END
    Should Be Equal      ${found}    ${False}

Validate Cart Item Quantity Is 1
    [Documentation]    Verify that the displayed cart quantity is 1.
    ${qty}=    Get Text    ${cart_item_quantity}
    Should Be Equal As Strings    ${qty}    1

Refresh Page
    [Documentation]    Reload the current page.
    Reload