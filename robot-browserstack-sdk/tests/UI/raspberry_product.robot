*** Settings ***
Documentation   Verification of the Raspberry product description
Suite Setup   Setup for url     ${url2}    ${ENVIRONMENT}
Test Teardown   Close Browser session after the end
Resource        ../../steps/raspberry_product_steps.robot

*** Test Cases ***
Verification of the Raspberry product description
    [Tags]     WEB
    Wait Until Navigation Tabs Are Located    
    Click on tab with Name      ${tab_name}
    Click on the flavoured drink     ${flavoureDrink}
    Verifying the flavoured drink description
Verification of the Raspberry product description on mobile
    [Tags]     MOBILE
    Click on the hamburger icon
    Wait Until Navigation Tabs Are Located    
    Click on tab with Name      ${tab_name}
    Click on the flavoured drink     ${flavoureDrink}
    Verifying the flavoured drink description
    
