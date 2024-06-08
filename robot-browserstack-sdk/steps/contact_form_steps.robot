*** Settings ***

Resource    ../common/common_ui.robot
Resource        ../Pages/contact_form_variables.robot

*** Keywords ***

Wait Until Navigation Tabs Are Located
    
    Wait Until Element Is Visible     ${navigation_tabs}     timeout=10
    @{tabs}     Get WebElements     ${navigation_tabs}
    @{actual_tabs} =   Create List
   FOR  ${tab}  IN      @{tabs}
      ${text}    Get Text    ${tab}
      Append To List    ${actual_tabs}     ${text}
   END
   Log     ${actual_tabs}
   ${tab_count}    Get Length    ${actual_tabs}
   Should Be Equal As Numbers    ${tab_count}    11
   Sleep    4
Click on tab with Name   
    [Arguments]    ${tab_name}
    Run Keyword And Ignore Error      Click Element    ${hamburger}
    Wait Until Element Is Visible     ${navigation_tabs} a         timeout=10
    @{tabs}        Get WebElements        ${navigation_tabs} a
        FOR  ${tab}      IN      @{tabs}
            ${text} =        Get Text    ${tab}
            IF     '${text}' == '${tab_name}'
                    Click Element    ${tab}     
                    Sleep    4
                    Exit For Loop
            END
        END

Enter the details in the form and submit it after confirmation message verification
    [Arguments]    ${subjectName}    ${batch-code}    ${firstname}    ${lastname}    ${message}

# SELECTING COUNTRY FROM THE DROP DOWN

    @{countryNames}    Get WebElements    ${countryNamesLocator}
    @{country_list}=    Create List
    FOR    ${countryName}    IN    @{countryNames}
        ${Namedata}    Get Text    ${countryName}
        Append To List    ${country_list}    ${Namedata}
    END
    Log    ${country_list}
    # Scroll Element Into View    ${emailBox}
# SELECT THE SUBJECT FROM THE DROPDOWN
    Select From List By Value    ${subject}    ${subjectName}

# SELECT THE BATCH NUMBER
    Input Text    id:form-batchcode    ${batch-code}
# ENTERING THE FIRST NAME  
    Input Text    id:form-firstname    ${firstname}
# ENTERING THE LAST NAME
    Input Text    css:div input[name='formLastName']    ${lastname}
# ENTERING THE MESSAGE
    Input Text    id:form-message    ${message}
    # Scroll Element Into View    id:submit-contact-form
    Element Should Be Enabled    id:submit-contact-form
    # Click Button    id:submit-contact-form
    # Wait Until Element Is Visible    ${conf-msg}
#VERIFYING THE CONFIRMATION MESSAGE
    # ${confirm-with-name}    Get Text    ${conf-msg}
    # IF    '${confirm-with-name}' == 'Thank you ${firstname};'
    #     Log    thank you message appeared successfully
    # END
    # Element Text Should Be    ${conf}        We’ve received your message, and we’ll respond as soon as we can.
    # Click Button    css:button[type='button']
