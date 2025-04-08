*** Settings ***
Documentation    ตรวจสอบการสั่งสินค้า

Suite Setup    Open and maximize browser
Library     SeleniumLibrary
Resource    ../Keywords/standarduser__keywords.robot

Test Setup    Set Selenium Speed    0.25

*** Test Cases ***
Login with Valid username and password
    [Documentation]    เข้าสู่ระบบ
    Fill username    standard_user
    Fill password    secret_sauce
    Click Login
    Page should be inventory

Add product in cart
    [Documentation]    ตรวจสอบการเพิ่มสินค้าลงตะกร้า
    Click Element    xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Is Visible    xpath=//*[@id="remove-sauce-labs-backpack"]
    Wait Until Element Contains   ${cart_btn}   1    

    Click Element    xpath=//*[@id="add-to-cart-sauce-labs-bike-light"]
    Wait Until Element Is Visible    xpath=//*[@id="remove-sauce-labs-bike-light"]
    Wait Until Element Contains   ${cart_btn}    2    

Verify product in cart
    [Documentation]    ตรวจสอบสินค้าในตะกร้า
    Click Element    ${cart_btn}
    Page should be cart

Verify Your infomation
    [Documentation]    ตรวจสอบการกรอกข้อมูลที่อยู่
    Click Element    ${checkout_btn}
    Page should be Checkout
    Fill Firstname    Example
    Fill Lastname    Example
    Fill zipcode    1999
    Element Should Be Visible    ${cancel_btn}
    Element Should Be Visible    ${continue_btn}

Verify Overview
    [Documentation]    ตรวจสอบรายการสินค้าและยอดรวมทั้งหมด
    Click Element    ${continue_btn}
    Wait Until Location Is    ${checkout2_page}
    Location Should Be    ${checkout2_page}
    Wait Until Page Contains    Checkout: Overview
    Element Should Be Visible    ${total_txt}
    Element Should Be Visible    ${cancel_btn}
    Element Should Be Visible    ${finish_btn}

Verify order completed
    [Documentation]    ตรวจสอบการสั่งสินค้าสำเร็จ
    Click Element    ${finish_btn}
    Wait Until Location Is    ${checkoutcomplete_page}
    Location Should Be    ${checkoutcomplete_page}
    Wait Until Page Contains    Checkout: Complete!
    Wait Until Page Contains    Thank you for your order!
    Element Should Be Visible    ${backhome_page}
    

