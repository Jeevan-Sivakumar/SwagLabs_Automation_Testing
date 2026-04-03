*** Settings ***
Documentation     Swag Labs Product Details test cases
Library           Browser
Library           DataDriver    file=../../../datasets/dataset_AIPQA-138.csv    encoding=utf_8    dialect=excel    delimiter=,
Resource          ../../../resources/SwagLabs/Products/tasks.resource
Test Teardown     Close Browser
Test Template     Verify User Can Open Product Details Page

*** Test Cases ***
AIPQA-138 Verify user can open product details page
    [Documentation]    Verify that user can click a product name, open the product details page, and view matching details from dataset.
    [Tags]    SwagLabs    Products    DataDriven    AIPQA-138
    Default