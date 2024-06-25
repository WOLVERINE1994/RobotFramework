*** Settings ***
Documentation   Filling of the contact details
Suite Setup   Setup for url    ${url}    ${ENVIRONMENT}
Test Teardown   Close Browser session after the end
Resource    ../../steps/contact_form_steps.robot
Library    ../../customLibraries/custom_email.py

*** Test Cases ***

Navigated to Contact Page
    [Tags]    WEB
    Click on tab with Name      ${tab_name}
    Generate Random Email    ${domain}
    Enter the details in the form and submit it after confirmation message verification    ${subjectName}    ${batch-code}    ${firstname}    ${lastname}    ${message}

Navigated to Contact Page on mobile
    [Tags]    MOBILE
    Click on tab with Name      ${tab_name}
    Generate Random Email    ${domain}
    Enter the details in the form and submit it after confirmation message verification    ${subjectName}    ${batch-code}    ${firstname}    ${lastname}    ${message}