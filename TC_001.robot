*** Settings ***
Library  RequestsLibrary  # Importing the RequestsLibrary

*** Variables ***
${Base_URL}  https://thetestingworldapi.com  # Defining the base URL for the API

*** Test Cases ***
TC_001_Get_Request
    create session  Get_Students_Details  ${Base_URL}  # Creating a session with the base URL
    ${response}=  get request  Get_Students_Details  api/studentsDetails  # Sending a GET request to the specified endpoint
    log to console  ${response.status_code}  # Logging the response to the console
    log to console  ${response.content}      # Logging the response content to the console
