*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://thetestingworldapi.com


*** Test Cases ***
TC_04 Post Request
    create session  add_data  ${Base_URL}
    &{body}=  create dictionary  first_name=shubham  middle_name=kumar  last_name=Saharawat  date_of_birth=13/05/1997
    &{header}=  create dictionary  Content-Type=application/json
    ${Response}=  post request  add_data  /api/studentsDetails  data=${body}  headers=${header}
    log to console  ${Response.status_code}
    log to console  ${Response.content}