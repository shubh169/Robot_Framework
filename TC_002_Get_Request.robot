*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://thetestingworldapi.com
${Student_ID}  10300920

*** Test Cases ***
TC_002_Fetch_Student_Detail_With_ID
    create session  Fetch_Data  ${Base_URL}
    ${Response}=  GET On Session  Fetch_Data  api/studentsDetails/${Student_ID}
    ${Actual_Result}=  convert to string  ${Response.status_code}
    should be equal  ${Actual_Result}  200
    ${Json_Response}=  to json  ${Response.content}
    @{First_name_list}=  get value from json  ${Json_Response}  data.first_name
    log to console  ${first_name_list}                       # first name print in list
    ${first_name}=  get from list  ${First_name_list}  0
    log to console  ${first_name}

