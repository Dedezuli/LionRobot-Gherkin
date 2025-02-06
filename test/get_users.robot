*** Settings ***
Resource    ../resources/api_keywords.robot

*** Variables ***
${BASE_URL}    https://reqres.in/api
&{HEADERS}     accept=application/json
${ID}          2

*** Test Cases ***
Get Users List
    I Send A GET Request To "${BASE_URL}" With Headers "${HEADERS}"
    The Response Status Code Should Be "200"
    The Response Should Contain A List Of Users

Get User By ID
    I Send A GET Request To "${BASE_URL}" With Headers "${HEADERS}" And ID "${ID}"
    The Response Status Code Should Be "200"
    The Response Should Contain User With ID "${ID}"
