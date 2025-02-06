*** Settings ***
Library    RequestsLibrary

*** Keywords ***
I Send A GET Request To "${url}" With Headers "${headers}"
    Create Session    reqres    ${url}
    ${response}=    GET On Session    reqres    /users    headers=${headers}
    Set Test Variable    ${response}

The Response Status Code Should Be "${status_code}"
    Should Be Equal As Numbers    ${response.status_code}    ${status_code}

The Response Should Contain A List Of Users
    Should Not Be Empty    ${response.json()}[data]
    Log    ${response.json()}[data]

I Send A GET Request To "${url}" With Headers "${headers}" And ID "${id}"
    Create Session    reqres    ${url}
    ${response}=    GET On Session    reqres    /users/${id}    headers=${headers}
    Set Test Variable    ${response}

The Response Should Contain User With ID "${id}"
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json_response}[data][id]    ${id}
    Log    ${json_response}
    Log To Console    ${response.json()}

I Send A POST Request To Register User With Email "${email}" And Password "${password}"
    ${body}=    Create Dictionary    email=${email}    password=${password}
    Create Session    reqres    https://reqres.in
    ${response}=    POST On Session    reqres    /api/register    json=${body}
    Set Test Variable    ${response}

The Response Should Contain User ID "${id}" And Token "${token}"
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json_response}[id]    ${id}
    Should Be Equal    ${json_response}[token]    ${token}
    Log    ${json_response}
    Log To Console    ${response.json()}