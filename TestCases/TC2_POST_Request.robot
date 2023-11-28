*** Settings ***
Documentation    API Testing
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  https://restful-booker.herokuapp.com

*** Test Cases ***
Create Customer booking
    Create Session    Mysession    ${base_url}
    ${booking_dates}   Create Dictionary  checkin=2023-01-01      checkout=2023-01-23
    ${body} =  Create Dictionary   firstname=Gam  lastname=Gram  totalprice=347  depositpaid=true  bookingdates=${booking_dates}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${response}=  Post Request    Mysession    /booking   data=${body}  headers=${header}
    
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

#Validations
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal As Strings    ${status_code}    200


