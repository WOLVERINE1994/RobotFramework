*** Settings ***

Resource    ../common/common_ui.robot
Resource        ../Pages/raspberry_product_variables.robot

*** Variables ***
${actual-data}=    White Claw® Hard Seltzer Raspberry.Where fresh, ripe raspberry flavour meets cold, crisp refreshment. Enjoy the sweet yet tart flavour of White Claw® Hard Seltzer Raspberry today.95 Calories l 2g Carbs l Gluten Free l Natural Flavours.

*** Keywords ***
Click on the hamburger icon
    Click Element    ${hamburger}
Wait Until Navigation Tabs Are Located

    Wait Until Element Is Visible     ${navigation_tabs}
    @{tabs}     Get WebElements     ${navigation_tabs}    
   
    @{actual_tabs} =   Create List
   FOR  ${tab}  IN      @{tabs}
      ${text}    Get Text    ${tab}
      Append To List    ${actual_tabs}     ${text}
   END
   Log     ${actual_tabs}
   ${tab_count}    Get Length    ${actual_tabs}
   Should Be Equal As Numbers    ${tab_count}    6
   
Verify the presence of footers
    Wait Until Element Is Visible    ${footer_locators}
    @{footers}    Get WebElements    ${footer_locators}
    @{footers_headers} =     Create List
    FOR    ${footer}    IN    @{footers}
        ${footernames}    Get Text    ${footer}
        Append To List    ${footers_headers}    ${footernames}
    END
    Log    ${footers_headers}
    ${tab_count}    Get Length    ${footers_headers}
    Should Be Equal As Numbers    ${tab_count}    5
Click on tab with Name   
    [Arguments]    ${tab_name}
    Wait Until Element Is Visible     ${navigation_tabs}    ${timeout}
    @{tabs}    Get WebElements    ${navigation_tabs} a
        FOR  ${tab}  IN      @{tabs}
            ${text} =        Get Text    ${tab}    
            IF     '${text}' == '${tab_name}'
                    Click Element    ${tab}     
                    Sleep    4
                    Exit For Loop
            END
        END

Click on the flavoured drink
    [Arguments]    ${flavoureDrink}
    Wait Until Element Is Visible    ${flavouredItems}     ${timeout}
    @{flavouredItems_elements}    Get WebElements     ${flavouredItems}
        FOR    ${element}    IN    @{flavouredItems_elements}
            ${text}=     Get Text     ${element}
            IF     '${text}' == '${flavoureDrink}'
                    Click Element        ${element}     
                    Sleep    4
                    Exit For Loop
            END
        END

Verifying the flavoured drink description
    # Scroll Element Into View    ${product_name}
    Wait Until Element Is Visible        ${paragraph}
    Page Should Contain Element    ${paragraph}
    ${para_data}=    Get Text    ${paragraph}
    Should Be Equal    ${para_data}    ${actual-data}
    Sleep    4

Close Browser Session
    Close Browser

