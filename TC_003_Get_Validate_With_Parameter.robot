*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://reqres.in

*** Test Cases ***
TC_03 Get Request With Parameters
    create session  Get_Param  ${Base_URL}
    &{param}=  create dictionary  page=2
    ${Response}=  get request  Get_Param  /api/users  params=${param}
    ${response_status}=  convert to string  ${Response.status_code}
    should be equal  ${response_status}  200

    ${Json_Response}=  to json  ${Response.content}
    @{first_name_list}=  get value from json  ${Json_Response}  data[0].first_name
    log to console  ${first_name_list}
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
