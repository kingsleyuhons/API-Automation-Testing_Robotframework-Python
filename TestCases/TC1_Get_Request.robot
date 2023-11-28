*** Settings ***
Documentation    API Testing
Library   RequestsLibrary

*** Variables ***
${base_url}   https://restful-booker.herokuapp.com
${page}  199

*** Test Cases ***
Get_bookerInfo
    Create Session    Mysession    ${base_url}
    ${response}  get request    Mysession    /booking/${page}
    Log To Console    ${response.status_code}
    Log To Console  ${response.content}
    Log To Console    ${response.headers}


