*** Settings ***
Library     RequestsLibrary
Library     Collections
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL2}      https://prod-play.zephyr4jiracloud.com/connect/public/rest/api/2.0/automation/job
${BASE_URL3}      https://prod-play.zephyr4jiracloud.com/connect/public/rest/api/2.0/automation/job/execute
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
Create Automation Task
    ${headers}=    Create Dictionary    Accept=*/*
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
    ...    X-acpt=c4660f9b7d9897219e560fa31e15db24ad668c56bd42e6bdeccd687268a35c73e2ef4cc979ae4f0b8acd1d902785036f3df6b54bf9b678e392584f8a6cdab434edc185d84e5b3038e187dc4fadbd9304fa8a1bae6c3c19c99442ffce610b1a8539f4f95dca5fb0154a869e801cac72817bbf9bd674d33aabc32bfb5806232821e01bdae605498ba4f76f9d42941a9405eeca1fd945cbee78683aad4b236c614d5c2ec2c2b0bb207f38b69b16161cfe873bdc19bbee752eedb0bea879ea450cc86334a56c9aef6ae978f3803cce07df82b40a2592221abc594bb8937c1fd285c0
    ...    sec-ch-ua="Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"
    ...    sec-ch-ua-mobile=?0
    ...    sec-ch-ua-platform="Windows"

    ${reporter}=    Create Dictionary
    ...    label=Prateek Verma
    ...    name=Prateek Verma
    ...    id=712020:ca3404fd-ed24-4f93-805d-09be5bbd265b

    ${mandatory_fields}=    Create Dictionary
    ...    reporter=${reporter}

    ${payload}=    Create Dictionary
    ...    jobName=${JOB_NAME}
    ...    jobDescription=${JOB_DESCRIPTION}
    ...    automationFramework=${AUTOMATION_FRAMEWORK}
    ...    resultPath=
    ...    createPackage=${False}
    ...    agentId=
    ...    cycleName=${CYCLE_NAME}
    ...    folderName=${FOLDER_NAME}
    ...    assigneeUser=
    ...    cycleStartDate=
    ...    cycleEndDate=
    ...    projectId=10165
    ...    versionId=-1
    ...    cycleId=d28a8a19-7621-46da-87bd-170a3699d1a3
    ...    folderId=2ea8174a-c3d6-4473-b11e-9f7f53e98f2a
    ...    fileName=${FILE_PATH}
    ...    automationVia=Upload
    ...    autoScheduleDateTimePicker=
    ...    versionDisplayName=${VERSION_NAME}
    ...    appendDateTimeInCycleName=${False}
    ...    appendDateTimeInFolderName=${False}
    ...    originalCycleName=${CYCLE_NAME}
    ...    originalFolderName=${FOLDER_NAME}
    ...    mandatoryFields=${mandatory_fields}

    Create Session  create_task_session  ${BASE_URL2}  verify=${PEM_FILE}
    ${response}=    POST      ${BASE_URL2}      json=${payload}    headers=${headers}    verify=${True}
    Log    ${response.status_code}
    Log    ${response.content}
    # Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

    ${response_json}=    Evaluate    json.loads("""${response.content}""")    json
    ${auto_job_id}=    Set Variable    ${response_json}[autoJobId]
    Log    ${auto_job_id}
    
    RETURN    ${auto_job_id}
  
Execute the Automation Task
    [Arguments]    ${auto_job_id}
    Log    ${auto_job_id}
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
    ...    X-acpt=c4660f9b7d9897219e560fa31e15db24ad668c56bd42e6bdeccd687268a35c73e2ef4cc979ae4f0b8acd1d902785036f3df6b54bf9b678e392584f8a6cdab434edc185d84e5b3038e187dc4fadbd9304fa8a1bae6c3c19c99442ffce610b1a8539f4f95dca5fb0154a869e801cac72817bbf9bd674d33aabc32bfb5806232821e01bdae605498ba4f76f9d42941a9405eeca1fd945cbee78683aad4b236c614d5c2ec2c2b0bb207f38b69b16161cfe873bdc19bbee752eedb0bea879ea450cc86334a56c9aef6ae978f3803cce07df82b40a2592221abc594bb8937c1fd285c0
    ...    sec-ch-ua="Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"
    ...    sec-ch-ua-mobile=?0
    ...    sec-ch-ua-platform="Windows"
    ${payload2}=    Create Dictionary    jobId=${auto_job_id}
    ...    automationFramework=Junit
    ...    execute=${True}

    Create Session  create_task_session  ${BASE_URL3}  verify=${PEM_FILE}
    ${response}=    POST      ${BASE_URL3}      json=${payload2}    headers=${headers2}    verify=${True}
    Log    ${response.status_code}
    Log    ${response.content}
    # Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
*** Test Cases ***
Create Automation Task
    [Tags]    create
   ${auto_job_id}=    Create Automation Task
Execute the Automation Task
    [Tags]    execute    
    ${auto_job_id}=    Set Variable
    Execute the Automation Task    ${auto_job_id}