*** Settings ***
Library     RequestsLibrary
Library     Collections
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL2}      https://prod-play.zephyr4jiracloud.com/connect/public/rest/api/2.0/executions/search/folder/2ea8174a-c3d6-4473-b11e-9f7f53e98f2a?projectId=10165&versionId=-1&cycleId=d28a8a19-7621-46da-87bd-170a3699d1a3&offset=0&action=expand&sortBy=&sortOrder=asc&size=10&_=1719221112758
${BASE_URL3}      https://prod-play.zephyr4jiracloud.com/connect/public/rest/api/1.0/execution/103220a4-33ac-4e0c-877b-710cecbb4897?projectId=10165&issueId=98708&_=1719221199926
${BASE_URL4}      https://prod-play.zephyr4jiracloud.com/connect/public/rest/api/2.0/stepresultwithsteps/search?issueId=98708&executionId=103220a4-33ac-4e0c-877b-710cecbb4897&offsetOpt=0&sizeOpt=10&_=1719224407737
${BASE_URL5}      https://prod-play.zephyr4jiracloud.com/connect/public/rest/api/2.0/stepresult/24f83344-466b-4cf6-a32e-a8c8ad22d84f

${access_key}     MDc0MzMwNDMtMTMyYi0zYTVjLWIwYzAtNjg2OTJiMTIwNDVjIDU1NzA1OCUzQWY0YTc5MzEyLTZhMmQtNDAxOS05ZDFlLTcwMTMyYTI2MWUyNiBVU0VSX0RFRkFVTFRfTkFNRQ
${secret_key}     SwZP386jHYMADQMAsIX3ZgsO7BGjfYx6FxVWU6gdknM
${account_id}     557058:f4a79312-6a2d-4019-9d1e-70132a261e26
${PROJECT_KEY}    MCW
${JOB_NAME}       Job1
${AUTOMATION_FRAMEWORK}  JUNIT
${CYCLE_NAME}         Automation Test cycle-dummy
${FOLDER_NAME}        test2
${VERSION_NAME}       Unscheduled
${FILE_PATH}          junit_output2.xml
${JOB_DESCRIPTION}    Descriptions
${PEM_FILE}           C:/Users/prate/Downloads/cacert.pem
  
*** Keywords ***
Get test parent cases
    ${headers}=    Create Dictionary    Accept=*/*
    ...    Accept-Language=en-US,en;q=0.9
    ...    Cache-Control=no-cache
    ...    Connection=keep-alive
    ...    Content-Type=*/*
    # ...    Origin=https://prod-play.zephyr4jiracloud.com
    ...    Cookie=_BEAMER_USER_ID_JlXaHCXl29209=ab329b9b-1d14-4d67-94b8-8f88c9377955; _BEAMER_FIRST_VISIT_JlXaHCXl29209=2024-06-20T09:06:13.614Z; _BEAMER_DATE_JlXaHCXl29209=2024-06-20T09:06:17.422Z; _BEAMER_LAST_PUSH_PROMPT_INTERACTION_JlXaHCXl29209=1718874410472; _BEAMER_NPS_LAST_SHOWN_JlXaHCXl29209=1719206838475; _BEAMER_FILTER_BY_URL_JlXaHCXl29209=true; _BEAMER_FILTER_BY_URL_JlXaHCXl29209=true

    ...    Pragma=no-cache
    ...    Sec-Fetch-Dest=empty
    ...    Sec-Fetch-Mode=cors
    ...    Sec-Fetch-Site=same-origin
    ...    User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36
    ...    X-acpt=c4660f9b7d9897219e560fa31e15db24ad668c56bd42e6bdeccd687268a35c73e2ef4cc979ae4f0b8acd1d902785036f3df6b54bf9b678e392584f8a6cdab434edc185d84e5b3038e187dc4fadbd9304fa8a1bae6c3c19c99442ffce610b1a8539f4f95dca5fb0154a869e801cac72817bbf9bd674d33aabc32bfb5806232821e01bdae605498ba4f76f9d42941a9405eeca1fd945cbee78683aad4b236c614d5c2ec2c2b0bb207f38b69b16161cfe873bdc19bbee752eedb0bea879ea450cc8e4f3445cd1c0ab2824931864ffff5e89110e4e7b5a07f7fbf0af0e438ca5462e
    ...    sec-ch-ua="Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"
    ...    sec-ch-ua-mobile=?0
    ...    sec-ch-ua-platform="Windows"


    Create Session  create_task_session  ${BASE_URL2}      verify=${PEM_FILE}
    ${response}=    GET      ${BASE_URL2}      headers=${headers}    verify=${True}
    Log    ${response.status_code}
    Log        ${response.content}
    # Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
  
Change the status of parent

    ${headers2}=    Create Dictionary    Accept=*/*
    ...    Accept-Language=en-US,en;q=0.9
    ...    Cache-Control=no-cache
    ...    Connection=keep-alive
    ...    Content-Type=application/json
    ...    Origin=https://prod-play.zephyr4jiracloud.com
    ...    Pragma=no-cache
    ...    Sec-Fetch-Dest=empty
    ...    Sec-Fetch-Mode=cors
    ...    Sec-Fetch-Site=same-origin
    ...    User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36
    ...    X-acpt=c4660f9b7d9897219e560fa31e15db24ad668c56bd42e6bdeccd687268a35c73e2ef4cc979ae4f0b8acd1d902785036f3df6b54bf9b678e392584f8a6cdab434edc185d84e5b3038e187dc4fadbd9304fa8a1bae6c3c19c99442ffce610b1a8539f4f95dca5fb0154a869e801cac72817bbf9bd674d33aabc32bfb5806232821e01bdae605498ba4f76f9d42941a9405eeca1fd945cbee78683aad4b236c614d5c2ec2c2b0bb207f38b69b16161cfe873bdc19bbee752eedb0bea879ea450cc8e4f3445cd1c0ab2824931864ffff5e89110e4e7b5a07f7fbf0af0e438ca5462e
    ...    sec-ch-ua="Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"
    ...    sec-ch-ua-mobile=?0
    ...    sec-ch-ua-platform="Windows"
    ${status_id}=    Create Dictionary    id=2
    ${payload2}=    Create Dictionary    cycleId=d28a8a19-7621-46da-87bd-170a3699d1a3
    ...    folderId=2ea8174a-c3d6-4473-b11e-9f7f53e98f2a
    ...    id=103220a4-33ac-4e0c-877b-710cecbb4897
    ...    issueId=98708
    ...    projectId=10165
    ...    status=${status_id}
    ...    versionId=-1

    Create Session  create_task_session  ${BASE_URL3}  verify=${PEM_FILE}
    ${response}=    PUT      ${BASE_URL3}      json=${payload2}    headers=${headers2}    verify=${True}
    Log    ${response.status_code}
    Log    ${response.content}
    # Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

Get test steps
    ${headers}=    Create Dictionary    Accept=*/*
    ...    Accept-Language=en-US,en;q=0.9
    ...    Cache-Control=no-cache
    ...    Connection=keep-alive
    ...    Content-Type=*/*
    # ...    Origin=https://prod-play.zephyr4jiracloud.com
    ...    Cookie=_BEAMER_USER_ID_JlXaHCXl29209=ab329b9b-1d14-4d67-94b8-8f88c9377955; _BEAMER_FIRST_VISIT_JlXaHCXl29209=2024-06-20T09:06:13.614Z; _BEAMER_DATE_JlXaHCXl29209=2024-06-20T09:06:17.422Z; _BEAMER_LAST_PUSH_PROMPT_INTERACTION_JlXaHCXl29209=1718874410472; _BEAMER_NPS_LAST_SHOWN_JlXaHCXl29209=1719206838475; _BEAMER_FILTER_BY_URL_JlXaHCXl29209=true; _BEAMER_FILTER_BY_URL_JlXaHCXl29209=true

    ...    Pragma=no-cache
    ...    Sec-Fetch-Dest=empty
    ...    Sec-Fetch-Mode=cors
    ...    Sec-Fetch-Site=same-origin
    ...    User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36
    ...    X-acpt=c4660f9b7d9897219e560fa31e15db24ad668c56bd42e6bdeccd687268a35c73e2ef4cc979ae4f0b8acd1d902785036f3df6b54bf9b678e392584f8a6cdab434edc185d84e5b3038e187dc4fadbd9304fa8a1bae6c3c19c99442ffce610b1a8539f4f95dca5fb0154a869e801cac72817bbf9bd674d33aabc32bfb5806232821e01bdae605498ba4f76f9d42941a9405eeca1fd945cbee78683aad4b236c614d5c2ec2c2b0bb207f38b69b16161cfe873bdc19bbee752eedb0bea879ea450cc8e4f3445cd1c0ab2824931864ffff5e89110e4e7b5a07f7fbf0af0e438ca5462e
    ...    sec-ch-ua="Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"
    ...    sec-ch-ua-mobile=?0
    ...    sec-ch-ua-platform="Windows"


    Create Session  create_task_session  ${BASE_URL4}      verify=${PEM_FILE}
    ${response}=    GET      ${BASE_URL4}      headers=${headers}    verify=${True}
    Log    ${response.status_code}
    Log        ${response.content}
    # Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200


change the step status

    ${headers2}=    Create Dictionary    Accept=*/*
    ...    Accept-Language=en-US,en;q=0.9
    ...    Cache-Control=no-cache
    ...    Connection=keep-alive
    ...    Content-Type=application/json
    ...    Origin=https://prod-play.zephyr4jiracloud.com
    ...    Pragma=no-cache
    ...    Sec-Fetch-Dest=empty
    ...    Sec-Fetch-Mode=cors
    ...    Sec-Fetch-Site=same-origin
    ...    User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36
    ...    X-acpt=c4660f9b7d9897219e560fa31e15db24ad668c56bd42e6bdeccd687268a35c73e2ef4cc979ae4f0b8acd1d902785036f3df6b54bf9b678e392584f8a6cdab434edc185d84e5b3038e187dc4fadbd9304fa8a1bae6c3c19c99442ffce610b1a8539f4f95dca5fb0154a869e801cac72817bbf9bd674d33aabc32bfb5806232821e01bdae605498ba4f76f9d42941a9405eeca1fd945cbee78683aad4b236c614d5c2ec2c2b0bb207f38b69b16161cfe873bdc19bbee752eedb0bea879ea450cc8e4f3445cd1c0ab2824931864ffff5e89110e4e7b5a07f7fbf0af0e438ca5462e
    ...    sec-ch-ua="Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"
    ...    sec-ch-ua-mobile=?0
    ...    sec-ch-ua-platform="Windows"
    ${status_id}=    Create Dictionary    id=2
    ${payload2}=    Create Dictionary    executionId=103220a4-33ac-4e0c-877b-710cecbb4897
    ...    stepId=c924f135-f631-47db-bde0-94845a4638c2
    ...    id=103220a4-33ac-4e0c-877b-710cecbb4897
    ...    issueId=98708
    ...    status=${status_id}

    Create Session  create_task_session  ${BASE_URL5}  verify=${PEM_FILE}
    ${response}=    PUT      ${BASE_URL5}      json=${payload2}    headers=${headers2}    verify=${True}
    Log    ${response.status_code}
    Log    ${response.content}
    # Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

*** Test Cases ***
Get all parent cases
    [Tags]    getting
   Get test parent cases 
Change the parent case status
    [Tags]    changing
    Change the status of parent
Get test steps
    [Tags]    test_steps
    Get test steps
Change the step status
    [Tags]    change_status
    change the step status