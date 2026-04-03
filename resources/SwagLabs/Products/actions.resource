*** Settings ***
Documentation    Low-level Product actions
Library          Browser
Variables        ../../../configs/dev.py
Variables        ./page.py

*** Keywords ***
Validate Products Page Header
    [Documentation]    Verify that the Products page header is visible and displays the text Products.
    Wait For Elements State    ${products_title}    visible    timeout=${DEFAULT_TIMEOUT}
    ${header_text}=    Get Text    ${products_title}
    Should Be Equal As Strings    ${header_text}    Products

Validate All Product Cards Are Visible
    [Documentation]    Verify that product cards are visible on the Products page.
    ${count}=    Get Element Count    ${inventory_item}
    Should Be True    ${count} > 0

Validate Product Count Is Six
    [Documentation]    Verify that exactly six products are displayed on the Products page.
    ${count}=    Get Element Count    ${inventory_item}
    Should Be Equal As Integers    ${count}    6

Validate Product Exists On List Page
    [Documentation]    Verify that a product with the expected name, description, and price exists on the Products page.
    [Arguments]    ${expected_name}    ${expected_desc}    ${expected_price}

    ${names}=    Get Elements    ${inventory_item_name}
    ${descs}=    Get Elements    ${inventory_item_desc}
    ${prices}=   Get Elements    ${inventory_item_price}

    ${found}=    Set Variable    ${False}
    ${count}=    Get Length    ${names}

    FOR    ${index}    IN RANGE    ${count}
        ${name_text}=    Get Text    ${names}[${index}]
        ${desc_text}=    Get Text    ${descs}[${index}]
        ${price_text}=   Get Text    ${prices}[${index}]

        IF    '${name_text}' == '${expected_name}'
            Should Contain    ${desc_text}    ${expected_desc}
            Should Be Equal As Strings    ${price_text}    ${expected_price}
            ${found}=    Set Variable    ${True}
            BREAK
        END
    END

    Should Be Equal    ${found}    ${True}

Validate Add To Cart Button Is Visible For Product
    [Documentation]    Verify that the Add to Cart button is visible for the given product on the Products page.
    [Arguments]    ${product_name}

    IF    '${product_name}' == 'Sauce Labs Backpack'
        Wait For Elements State    ${add_to_cart_backpack_button}    visible    timeout=${DEFAULT_TIMEOUT}
    ELSE IF    '${product_name}' == 'Sauce Labs Bike Light'
        Wait For Elements State    ${add_to_cart_bike_light_button}    visible    timeout=${DEFAULT_TIMEOUT}
    ELSE IF    '${product_name}' == 'Sauce Labs Bolt T-Shirt'
        Wait For Elements State    ${add_to_cart_bolt_tshirt_button}    visible    timeout=${DEFAULT_TIMEOUT}
    ELSE IF    '${product_name}' == 'Sauce Labs Fleece Jacket'
        Wait For Elements State    ${add_to_cart_fleece_jacket_button}    visible    timeout=${DEFAULT_TIMEOUT}
    ELSE IF    '${product_name}' == 'Sauce Labs Onesie'
        Wait For Elements State    ${add_to_cart_onesie_button}    visible    timeout=${DEFAULT_TIMEOUT}
    ELSE IF    '${product_name}' == 'Test.allTheThings() T-Shirt (Red)'
        Wait For Elements State    ${add_to_cart_red_tshirt_button}    visible    timeout=${DEFAULT_TIMEOUT}
    ELSE
        Fail    Unsupported product name: ${product_name}
    END

Open Product Details Page From Product Name
    [Documentation]    Click a product name on the Products page and navigate to the Product Details page.
    [Arguments]    ${product_name}
    ${links}=    Get Elements    ${inventory_item_name}
    ${found}=    Set Variable    ${False}

    FOR    ${link}    IN    @{links}
        ${text}=    Get Text    ${link}
        IF    '${text}' == '${product_name}'
            Click    ${link}
            ${found}=    Set Variable    ${True}
            BREAK
        END
    END

    Should Be Equal    ${found}    ${True}

Validate Product Details Page Is Loaded
    [Documentation]    Verify that the product details page is loaded with name, description, and price visible.
    Wait For Elements State    ${inventory_details_name}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${inventory_details_desc}    visible    timeout=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${inventory_details_price}    visible    timeout=${DEFAULT_TIMEOUT}

Validate Product Details Page Content
    [Documentation]    Verify that the Product Details page content matches the expected name, description, and price.
    [Arguments]    ${expected_name}    ${expected_desc}    ${expected_price}

    ${actual_name}=    Get Text    ${inventory_details_name}
    ${actual_desc}=    Get Text    ${inventory_details_desc}
    ${actual_price}=   Get Text    ${inventory_details_price}

    Should Be Equal As Strings    ${actual_name}    ${expected_name}
    Should Contain    ${actual_desc}    ${expected_desc}
    Should Be Equal As Strings    ${actual_price}    ${expected_price}

Validate Add To Cart Button Is Visible On Details Page
    [Documentation]    Verify that the Add to Cart button is visible on the Product Details page.
    Wait For Elements State    ${add_to_cart_button}    visible    timeout=${DEFAULT_TIMEOUT}