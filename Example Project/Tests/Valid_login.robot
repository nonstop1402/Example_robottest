*** Settings ***
Documentation    ตรวจสอบการล็อกอิน

Library     SeleniumLibrary
Resource    ../Keywords/Login__keywords.robot
Test Setup    Set Selenium Speed    0.25


*** Test Cases ***
Open and maximize browser
    Open Browser    ${login_page}    ${browser}
    Maximize Browser Window

Login with Valid username and password
    Element Should Be Visible    ${username_input}
    Element Should Be Visible    ${password_input}
    Element Should Be Enabled    ${login_btn}
    Fill username    standard_user
    Fill password    secret_sauce
    Click Login
    Page should be inventory

    Close Browser