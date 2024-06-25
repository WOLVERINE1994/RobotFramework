*** Variables ***
${days}     xpath=//input[@id='ag-day']
${months}    xpath=//input[@id='ag-month']
${years}    xpath=//input[@id='ag-year']
${checkbox}    id:ag-remember
${warning}    css:.warning
${consent_data}    css:.ag-consent
${confirm-button}    xpath=//input[@id='ag-confirm']
${flavor}    xpath=(//a[contains(@class,'')][normalize-space()='Flavors'])[1]
${Innovation}    xpath=(//a[contains(@class,'')][normalize-space()='Innovation'])[1]
${Find}    xpath=//header[@role='banner']//a[normalize-space()='Find']
${FAQ}    xpath=//header[@role='banner']//a[normalize-space()='FAQ']
${contact}    xpath=//header[@role='banner']//a[normalize-space()='Contact']
${item}        xpath=(//img[contains(@src, 'harder-lemonade.png')])[1]
${lemonade}    css:div.animation-element:nth-of-type(2)
${lemoDescription}        css:div p.section-desc
${managecookies}    id:onetrust-pc-btn-handler
${managechoices}    css:button.onetrust-close-btn-handler
${navbar}    id:navbar-toggler
