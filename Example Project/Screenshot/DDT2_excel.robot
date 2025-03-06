*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Resources/Logindata.xlsx    sheet_name=Sheet1

Test Setup      Open Browser    https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F    chrome
Test Teardown   Close Browser

*** Test Cases ***
LoginWithExcel
    [Template]    Invalid Login
    ${username}    ${password}

*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Log    Username: ${username} - Password: ${password}
    Input Text    id=Email    ${username}
    Input Text    id=Password    ${password}
    Click Element    xpath=//button[@type='submit']
    Sleep    2s  # ให้เวลาดูผลลัพธ์
    Capture Page Screenshot
