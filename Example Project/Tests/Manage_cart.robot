*** Settings ***
Documentation    ตรวจสอบการเพิ่มสินค้าและนำสินค้าออกจากตะกร้า

Library     SeleniumLibrary
Resource    ../Keywords/standarduser__keywords.robot
Test Setup    Set Selenium Speed    0.25
Suite Setup    Open and maximize browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Login As Standard User
    Login With Credentials    standard_user    secret_sauce

Add product in cart
    [Documentation]    ตรวจสอบการเพิ่มสินค้าลงตะกร้า
    Click Element    xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Is Visible    xpath=//*[@id="remove-sauce-labs-backpack"]
    Wait Until Element Contains   ${cart_btn}   1    

    Click Element    xpath=//*[@id="add-to-cart-sauce-labs-bike-light"]
    Wait Until Element Is Visible    xpath=//*[@id="remove-sauce-labs-bike-light"]
    Wait Until Element Contains   ${cart_btn}    2   

Remove product in cart
    [Documentation]    ตรวจสอบการนำสินค้าออกจากตะกร้า
    Click Element    ${cart_btn}
    Click Element    //*[@id="remove-sauce-labs-backpack"]
    Wait Until Element Contains   ${cart_btn}   1    
    Click Element    //*[@id="remove-sauce-labs-bike-light"]
    Element Should Not Be Visible    //*[@id="cart_contents_container"]/div/div[1]/div[3]   
    

