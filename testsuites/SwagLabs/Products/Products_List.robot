*** Settings ***
Documentation     Swag Labs Product List test cases
Library           Browser
Library           DataDriver    file=../../../datasets/dataset_AIPQA-111.csv    encoding=utf_8    dialect=excel    delimiter=,
Resource          ../../../resources/SwagLabs/Products/tasks.resource
Test Teardown     Close Browser
Test Template     Verify Product Details Displayed Correctly From Dataset

*** Test Cases ***
AIPQA-111 Verify product details are displayed correctly from dataset
    [Documentation]    Verify product name, description, price, and Add to Cart button using dataset-driven validation.
    [Tags]    SwagLabs    Products    DataDriven    AIPQA-111
    Default