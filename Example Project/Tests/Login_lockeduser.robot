*** Settings ***
Documentation    ตรวจสอบการล็อกอินด้วย User ที่ถูกล็อค

Library     SeleniumLibrary
Resource    ../Keywords/standarduser__keywords.robot
Test Setup    Set Selenium Speed    0.25
Suite Setup    Open and maximize browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Login As Locked User
    Login With Credentials    locked_out_user    secret_sauce    
    ${Actual_error}=    Get Text     xpath=//*[@id="login_button_container"]/div/form/div[3]
    Should Be Equal As Strings    ${Actual_error}    Epic sadface: Sorry, this user has been locked out.    Error message does not match!
