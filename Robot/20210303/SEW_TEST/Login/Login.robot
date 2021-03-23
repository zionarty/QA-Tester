*** Settings ***
Library    Selenium2Library

*** Variables***
${browser}     chrome
${url}         http://backend.sew.com/login
${username}    enova
${password}    maneerat33561
${post_no}     01

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

*** Test Cases ***
login
    open web
    key username
    submit login
    select pos time