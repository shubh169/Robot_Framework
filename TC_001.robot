*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Application_URL}  https://www.thetestingworld.com

*** Test Cases ***
TC_001_Get_Request
    ${url}=  set variable  Hello World
    log to console  ${Application_URL}
    log to console  ${url}
