*** Settings ***
Library     Selenium2Library

*** Variables ***
${browser}     chrome
${url}         http://backend.sew.com/login
${username}    enova
${password}    maneerat33561
${post_no}     01
${bill_period}  256402
${collection}   938

*** Keywords ***
open web
    Open Browser    ${url}    ${browser}
key username
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
submit login
    Submit Form
select pos time
    Select From List By Value    name=pos_no    ${post_no}
    Submit Form
# open f16 Page
    
# input data
#     Input Text  name=search-period  ${bill_period}
#     input Text  name=search-collection  ${collection}
#     Submit Form
*** Test Cases ***
SearchF16
    open web
    key username
    submit login
    select pos time
    # open f16 Page
    # input data