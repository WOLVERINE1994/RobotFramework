*** Settings ***
Library    Dialogs
Library    Collections
Resource    ../Pages/mikes_variables.robot
Resource        ../common/common_ui.robot

*** Keywords ***
Open the broswer
    Open Browser    ${baseurl}        Chrome
    Maximize Browser Window
    Sleep    5s
Enter date of birth then submit the age gate
    [Arguments]    ${month}    ${day}    ${year}
    Input Text    id:ag-month    ${month}
    Input Text   id:ag-day     ${day}
    Input Text    id:ag-year    2000
    Click Element    id:ag-confirm
Enter date of birth then submit the age gate and verify the presence of the options
    [Arguments]    ${month}    ${day}    ${year}
    Input Text    id:ag-month    ${month}
    Input Text   id:ag-day     ${day}
    Input Text    id:ag-year    ${year}
    Click Element    id:ag-confirm
    Location Should Be    https://www.mikeshard.com/  
    Click Element     ${managecookies-mike} 
    Click Element     ${managechoices}
    Click Element     ${hamburger}
    Wait Until Element Is Visible        ${Flavour-tab}
    Element Should Be Visible     ${Flavour-tab}

Enter date of birth then submit the age gate and verify the message
    [Arguments]    ${month}    ${day}    ${year}
    Input Text    id:ag-month    ${month}
    Input Text   id:ag-day     ${day}
    Input Text    id:ag-year    ${year}
    Click Element    id:ag-confirm
    ${msg}=    Get Text    xpath=//p[text()='Sorry about that. You must be 21+ to enter.']

Navigate to tab:
    [Arguments]    ${limonada-tab}
    Click Element    ${limonada-tab}
     Sleep    5s
Banner image description should be:
    [Arguments]    ${para-data}
     ${description} =    Get Text   xpath =//*[contains(text(),'Discover')]
       Should Be Equal As Strings    ${description}    ${para-data}  
    
Check the presence of products available in Product carousel
    [Arguments]    ${list-products-user}
    @{actual-products}=    Create List
    
    @{products}     Get WebElements       ${product-list}
        FOR    ${individual-productlocator}    IN    @{products}
           
            ${product-name}=    Get Text    ${individual-productlocator}
            Append To List    ${actual-products}    ${product-name}
        END
            Log    ${actual-products}
           Run Keyword If    ${list-products-user} == ${actual-products}   Log    list are Equal
           ...    ELSE    Fail    product not matching


Select the desired navigation menu
    [Arguments]    ${desired-menu}
    @{Expected-navigation-menu}=    Create List
    Wait Until Element Is Visible        ${navigation-menu}        timeout=10s
    @{nav-bar-locators}    Get WebElements    ${navigation-menu}
    FOR    ${nav-bar-name}    IN    @{nav-bar-locators}
      ${nav-menu-list} =      Get Text        ${nav-bar-name}
      Append To List    ${Expected-navigation-menu}        ${nav-menu-list}    
         IF    '${nav-menu-list}' == '${desired-menu}'
            Click Element      ${nav-bar-name}
            Sleep    4
            Exit For Loop
        END
     END
    Log    ${Expected-navigation-menu}