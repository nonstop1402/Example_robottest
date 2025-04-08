*** Settings ***
Documentation    ตรวจสอบว่าเมนูแสดงขึ้นมาหลังจากคลิกไอคอน ☰

Library     SeleniumLibrary
Resource    ../Keywords/standarduser__keywords.robot
Test Setup    Set Selenium Speed    0.25
Suite Setup    Open and maximize browser

*** Test Cases ***
Login with Valid username and password
    [Documentation]    ตรวจสอบการเข้าสู่ระบบ
    Fill username    standard_user
    Fill password    secret_sauce
    Click Login
    Page should be inventory

Verify Hamburger Menu Opens Correctly
    [Documentation]    ตรวจสอบว่าเมนูแสดงขึ้นมาหลังจากคลิกไอคอน ☰
    Click Element    ${menu_btn}
    Wait Until Element Is Visible    ${menu_list}
    Element Should Be Visible    //*[@id="react-burger-cross-btn"]
    Element Should Be Visible    ${menu_list}
    Element Should Contain    ${menu_list}    All Items
    Element Should Contain    ${menu_list}    About
    Element Should Contain    ${menu_list}    Logout
    Element Should Contain    ${menu_list}    Reset App State

Verify Logout Button Works
    [Documentation]    ตรวจสอบว่าปุ่ม Logout ทำงานและกลับไปหน้า Login
    Click Element    ${logout_btn}
    Wait Until Location Contains    ${login_page}
    