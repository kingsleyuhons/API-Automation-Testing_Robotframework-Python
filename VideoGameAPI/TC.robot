*** Settings ***
Documentation    Video Game API

Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}   http://localhost:8080

*** Test Cases ***
TC1: Retrieve all video games in DB (GET)
    Create Session    mysession    ${base_url}
    ${response}=    Get Request    mysession    /app/videogames
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #VALIDATIONS
    ${status_code}=     convert to string    ${response.status_code}
    Should Be Equal    ${status_code}    200

TC2: Create a new VideoGame in DB (POST)
    Create Session    mysession    ${base_url}
    ${body}=    Create Dictionary   id=110  name=JesuOjenor  releasedate=2023-11-14T13:23:20.501Z   reviewScore=98   category=life   rating=universal
    ${header}   Create Dictionary   Content-Type=application/json
    ${response}=    Post Request    mysession    /app/videogames    data=${body}    headers=${header}
    #Print
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #VALIDATIONS
    ${status_code}=     Convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    200
    
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    Record Added Successfully
    
TC3: Retrieve details of a single game from DB using ID (GET)
    Create Session    mysession    ${base_url}
    ${response}=    Get Request    mysession    /app/videogames/110
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #VALIDATION
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    JesuOjenor


TC4: Update an existing Video game by adding a new body (PUT)
    Create Session    mysession    ${base_url}
    ${body}=    Create Dictionary   id=110  name=JesuUweseoo  releaseDate=2023-11-14T13:23:20.501Z   reviewScore=100   category=life   rating=Global
    ${header}   Create Dictionary   Content-Type=application/json
    ${response}=    Put Request    mysession    /app/videogames/110    data=${body}    headers=${header}
    #Print
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #VALIDATIONS
    ${status_code}=     Convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    JesuUweseoo
    
TC5: Delete a Video Game by ID (DELETE)
    Create Session    mysession    ${base_url}
    ${response}=    Delete Request    mysession    /app/videogames/110
    #VALIDATIONS
    ${status_code}=     Convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    Record Deleted Successfully
    
*** Keywords ***
Provided precondition
