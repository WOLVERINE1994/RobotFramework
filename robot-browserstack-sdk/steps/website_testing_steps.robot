*** Settings ***
Resource    ../common/common_ui.robot
Resource    ../pages/website_testing_variables.robot

*** Keywords ***
Verify that the Page Should Contain Flavour
    [Arguments]    ${flavor}
    Element Text Should Be      ${flavor}      FLAVORS

Verify that the Page should contain Innovation
    [Arguments]   ${Innovation}
    Element Text Should Be    ${Innovation}    INNOVATION

Verify that the Page should contains Find tab
    [Arguments]    ${Find}
    Element Text Should Be    ${Find}       FIND

Verify that the Page should contains contact tab
    [Arguments]    ${contact}
    Element Text Should Be    ${contact}    CONTACT

Verify that the Page should contains FAQ tab
    [Arguments]         ${faq}
    Element Text Should Be    ${faq}        FAQ

Click on the Flavour
     [Arguments]    ${flavor}
     Click Element    ${flavor}

Verify the description data of the lemonade
    Element Text Should Be        ${lemoDescription}        Lemonade with the volume turned up. Lemonade that hits harder.

Verify that the Page Should Contain Flavour in mobile
    [Arguments]    ${flavor}
    Click Element        ${managecookies}
    Wait Until Element Is Visible        ${managechoices}        ${timeout}
    Click Element    ${managechoices}
    Click Element    ${navbar}
    Wait Until Element Is Visible        ${flavor}        ${timeout}
    Element Text Should Be      ${flavor}      FLAVORS
    Element Text Should Be    ${Innovation}    INNOVATION
    Element Text Should Be    ${Find}       FIND
    Element Text Should Be    ${contact}    CONTACT
    Element Text Should Be    ${faq}        FAQ
Click on the Flavour tab and verify the product description
    Click on the Flavour     ${flavor}
    Wait Until Element Is Visible        ${lemonade}
    Page Should Contain Image        ${item}
    Click Image     ${item}
    Wait Until Element Is Visible     ${lemoDescription}
    Verify the description data of the lemonade