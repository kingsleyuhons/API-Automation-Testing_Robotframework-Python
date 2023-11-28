*** Settings ***
Documentation    API Testing
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}   https://restful-booker.herokuapp.com

*** Test Cases ***
Update an existing booker by adding a new body (PUT)
    Create Session    mysession    ${base_url}
    ${booking_dates}   Create Dictionary  checkin=2023-01-01      checkout=2023-01-23
    ${body} =  Create Dictionary   id=199  firstname=Gamma  lastname=Gramarly  totalprice=347  depositpaid=true  bookingdates=${booking_dates}
    ${header}   Create Dictionary   Content-Type=application/json
    ${response}=    Put Request    mysession    /booking    data=${body}    headers=${header}
    #Print
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #VALIDATIONS
    ${status_code}=     Convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    Gamma