*** Settings ***
Documentation     A resource file with common Libraries
Library           SeleniumLibrary
Library           Collections
Library           String
Library           OperatingSystem
Library           BuiltIn
Library           ../customLibraries/custom_email.py
Resource           ../pages/website_testing_variables.robot

*** Variables ***
&{website_logos}
...    https://at.whiteclaw.com/en/=//div/picture/img[@id='age-gate-logo']
...    https://au-dev.whiteclaw.com/=//div/picture/img[@id='age-gate-logo']
...    https://www.mikesharder.com/=//div/a[@href='/']/picture/img

${url}         https://at-dev.whiteclaw.com/en/
${url2}         https://au-dev.whiteclaw.com/
${url_mikeshared}        https://www.mikesharder.com/
${browser_name}         Chrome
${OUTPUTDIR}        C:/Users/Prateek/Downloads/PROJECTS/browserstack-robot Framework/robot-browserstack-sdkLatest/robot-browserstack-sdkLatest/robot-browserstack-sdkLatest
${timeout}        20
${close_privacy}          xpath=//button[@aria-label='close modal']

*** Keywords ***
SuiteSetup
    [Arguments]    ${url}    ${env}
    Run Keyword And Ignore Error    Remove Files    ${OUTPUTDIR}/selenium-screenshot-*.png
    Remove Files    customLibraries/__pycache__/*
    Open Browser    ${url}    ${browser_name}
    Maximize Browser Window
    Location Should Be    ${url}
    Check Website Logo    ${url}
    Set Global Variable    ${ENVIRONMENT}    ${env}    # Set the environment variable dynamically
    Sleep    5
    Fill the Date of Birth

Check Website Logo
    [Arguments]    ${url}
    ${keys}=    Get Dictionary Keys    ${website_logos}
    FOR    ${key}    IN    @{keys}
        Log    Checking ${key} against ${url}
        Run Keyword If    '${url}' == '${key}'    Run Keyword And Return        Get From Dictionary     ${website_logos}    ${key}
    END

Check Element Presence
    [Arguments]    ${locator}
    Log    Checking presence of element with locator: ${locator}
    Element Should Be Visible    ${locator}

Fill the Date of Birth
    Run keyword And Ignore Error        Additional Steps for Contact_Form
    Input Text    ${days}    1
    Input Text    ${months}    1
    Input Text   ${years}    1999
    Run Keyword And Ignore Error        Additional Steps for WC
    Click Button     ${confirm-button}

Additional Steps for WC
    Select Checkbox     ${checkbox}
    Checkbox Should Be Selected     ${checkbox}
    ${warning_message}=     Get Text     ${warning}
    Log     ${warning_message}
    ${consent}=     Get Text     ${consent_data}
    Log     ${consent}

Additional Steps for Contact_Form
   Wait Until Element Is Visible    ${close_privacy}
    Click Element    ${close_privacy}
    Sleep    2
Setup for url
    [Arguments]    ${url}    ${env}
    SuiteSetup    ${url}    ${env}

Close Browser session after the end
    Close Browser
