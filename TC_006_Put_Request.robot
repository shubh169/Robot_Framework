*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://thetestingworldapi.com
${Student_ID}  10300945


*** Test Cases ***
TC_04 Put Request
    create session  Put_data  ${Base_URL}
    &{body}=  create dictionary  id=${Student_ID}  first_name=shubham  middle_name=Chaudhary  last_name=Saharawat  date_of_birth=13/05/1997
    &{header}=  create dictionary  Content-Type=application/json
    ${Response}=  put request  Put_data  /api/studentsDetails/${Student_ID}  data=${body}  headers=${header}
    log to console  ${Response.status_code}
    log to console  ${Response.content}
