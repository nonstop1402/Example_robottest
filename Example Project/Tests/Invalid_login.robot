*** Settings ***
Documentation    ตรวจสอบการล็อกอินกรณีชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

Library     SeleniumLibrary
Resource    ../Keywords/Login__keywords.robot

Test Template    Invalid Login
Suite Setup    Open and maximize browser
Suite Teardown    Close All Browsers
Test Setup    Set Selenium Speed    0.25

*** Variables ***
${Valid_user}    standard_user
${Valid_password}    secret_sauce
${Invalid_user}    invalid_user
${Invalid_password}    invalid_password

# ข้อความแจ้งเตือนที่คาดหวัง
${Error_empty_password}    Epic sadface: Password is required
${Error_wrong_password}    Epic sadface: Username and password do not match any user in this service
${Error_wrong_user}        Epic sadface: Username and password do not match any user in this service


*** Test Cases ***                username            password                Expected
Right user empty password        ${Valid_user}        ${EMPTY}                ${Error_empty_password}
Right user wrong password        ${Valid_user}       ${Invalid_password}     ${Error_wrong_password}
Wrong user right password        ${Invalid_user}     ${Valid_password}       ${Error_wrong_user}
Wrong user empty password        ${Invalid_user}     ${EMPTY}                ${Error_empty_password}
Wrong user wrong password        ${Invalid_user}     ${Invalid_password}     ${Error_wrong_user}


*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}    ${expected_error}
    Clear Element Text    ${password_input}
    Fill username    ${username}
    Fill password    ${password}
    Click Login

    Clear Element Text    ${password_input}
    ${Actual_error}=    Get Text     xpath=//*[@id="login_button_container"]/div/form/div[3]
    Log   Actual Error: "${actual_error}"
    Should Be Equal As Strings    ${actual_error}    ${expected_error}    Error message does not match!
    
    
