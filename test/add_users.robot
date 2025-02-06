*** Settings ***
Resource    ../resources/api_keywords.robot

*** Variables ***
${BASE_URL}    https://reqres.in/api
&{HEADERS}     accept=application/json

*** Test Cases ***
Register A User Successfully
    I Send A POST Request To Register User With Email "charles.morris@reqres.in" And Password "pistol"
    The Response Status Code Should Be "200"
    The Response Should Contain User ID "5" And Token "QpwL5tke4Pnpja7X5"