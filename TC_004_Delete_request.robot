*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://thetestingworldapi.com
${Student_ID}  10300920

*** Test Cases ***
TC_04 Delete Request
    create session  Student_info  ${Base_URL}
    ${Response}=  delete request  Student_info  api/studentsDetails/${Student_ID}
#    log to console  ${Response.status_code}
#    log to console  ${Response.content}
# Validate status code
    ${Response_code}=  convert to string  ${Response.status_code}
    should be equal  ${Response_code}  200
