*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://reqres.in/api/

*** Test Cases ***
Get User Data
    [Documentation]    This test case sends a GET request to the Reqres API and validates the response.

    # Create a session with the base URL
    Create Session    reqres    ${BASE_URL}

    # Send a GET request to the /users endpoint with the defined body
    ${response}=    Get On Session    reqres    /users

    # Log the response for debugging
    Log    ${response.text}

Post User Data
       