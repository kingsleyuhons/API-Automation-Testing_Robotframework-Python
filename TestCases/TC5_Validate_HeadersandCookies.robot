*** Settings ***
Documentation    Validating headers and cookies

Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}   http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    Create Session    mysession    ${base_url}
    ${response}     Get Request    mysession    /photos

    Log To Console    ${response.headers}

    #VALIDATION
    ${ContenTypeValue}=  Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${ContenTypeValue}    application/json; charset=utf-8

    ${ContenEncodeValue}=  Get From Dictionary    ${response.headers}    Content-Encoding
    Should Be Equal    ${ContenEncodeValue}    gzip

TestCookies
    Create Session    mysession    ${base_url}
    ${response}     Get Request    mysession    /photos
    Log To Console    ${response.cookies}
