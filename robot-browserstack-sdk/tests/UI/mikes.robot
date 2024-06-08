*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    Dialogs
Library    Collections
Resource    ../../Pages/mikes_variables.robot
Resource    ../../steps/mikes_steps.robot
Resource    ../../steps/contact_form_steps.robot


*** Test Cases ***
TC01: Valid login
    [Tags]    WEB
    Open the broswer    
    Enter date of birth then submit the age gate    01    01    2000
#Verify the site URL present in the address bar
    Location Should Be    https://www.mikeshard.com/    
    Element Should Be Visible    ${Flavour-tab}
    Delete All Cookies
    Close Browser
TC02: Invalid login
    [Tags]    WEB
    Open the broswer
    Enter date of birth then submit the age gate and verify the message     01    01    2008 
    Delete All Cookies
    Close Browser
    

TC03: Limoda page content
    [Tags]    WEB
    Open the broswer
    Enter date of birth then submit the age gate    01    01    2000
    Select the desired navigation menu    LIMONADA
     Banner image description should be:    ${para-data}
    Check the presence of products available in Product carousel    ${list-products-user}
    # Pause Execution
    [Teardown]
    Close Browser

TC04: Valid login on mobile
    [Tags]    MOBILE
    Open the broswer    
    Enter date of birth then submit the age gate and verify the presence of the options    01    01    2000
    Delete All Cookies
    Close Browser
TC05: Invalid login check on mobile
    [Tags]    MOBILE
    Open the broswer
    Enter date of birth then submit the age gate and verify the message     01    01    2024
    Delete All Cookies
    Close Browser
TC06: Limoda page content on mobile
    [Tags]    MOBILE
    Open the broswer
    Enter date of birth then submit the age gate and verify the presence of the options    01    01    2000
    Select the desired navigation menu    LIMONADA
    Banner image description should be:    ${para-data}
    Check the presence of products available in Product carousel    ${list-products-user}
    Delete All Cookies
    Close Browser