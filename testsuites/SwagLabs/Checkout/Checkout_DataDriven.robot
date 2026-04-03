*** Settings ***
Documentation     Checkout Information (Data-driven)
Library           DataDriver    file=../../../datasets/dataset_AIPQA-91.csv    encoding=utf_8    dialect=excel    delimiter=,
Resource          ../../../resources/SwagLabs/Checkout/tasks.resource
Test Template     AIPQA-91 Validate Checkout Information
Test Teardown     Close Browser

*** Test Cases ***
AIPQA-91 Checkout Information Validation
    [Documentation]    Verify checkout input validation using dataset-driven approach.
    [Tags]    SwagLabs    Checkout    DataDriven    AIPQA-91
    Default
    
*** Keywords ***
AIPQA-91 Validate Checkout Information
    [Arguments]    ${First_Name}    ${Last_Name}    ${Postal_Code}    ${Expected_Result}
    Go To Checkout Information Page
    Enter Checkout Information And Validate    ${First_Name}    ${Last_Name}    ${Postal_Code}
    Validate Checkout Result According To Dataset    ${Expected_Result}