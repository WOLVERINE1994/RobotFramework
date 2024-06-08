*** Settings ***
Suite Setup    Setup for url    ${url_mikeshared}    ${ENVIRONMENT}
Test Teardown   Close Browser session after the end
Resource        ../../steps/website_testing_steps.robot

*** Test Cases ***
Existance of Limonada flavors
    [Tags]     WEB    REGRESSION
    Verify that the Page Should Contain Flavour         ${flavor}
    Verify that the Page should contain Innovation         ${Innovation}
    Verify that the Page should contains Find tab        ${Find}
    Verify that the Page should contains contact tab     ${contact}
    Verify that the Page should contains FAQ tab      ${faq}
    Click on the Flavour     ${flavor}
    Wait Until Element Is Visible        ${lemonade}         timeout=20
    Scroll Element Into View        ${lemonade}
    Page Should Contain Image        ${item}
    Click Image     ${item}
    Wait Until Element Is Visible     ${lemoDescription}
    Verify the description data of the lemonade

Existance of Limonada flavors on mobile
    [Tags]     MOBILE    REGRESSION
    Verify that the Page Should Contain Flavour in mobile    ${flavor}
    Verify that the Page should contain Innovation         ${Innovation}
    Verify that the Page should contains Find tab        ${Find}
    Verify that the Page should contains contact tab     ${contact}
    Verify that the Page should contains FAQ tab      ${faq}
    Click on the Flavour tab and verify the product description