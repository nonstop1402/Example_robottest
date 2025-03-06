*** Settings ***
Documentation    ตรวจสอบการแสดงรายละเอียดสินค้า

Library     SeleniumLibrary
Resource    ../Keywords/Login__keywords.robot

Test Setup    Set Selenium Speed    0.25

*** Test Cases ***
Open and maximize browser
    Open Browser    ${login_page}    ${browser}
    Maximize Browser Window

Login with Valid username and password
    Fill username    standard_user
    Fill password    secret_sauce
    Click Login
    Page should be inventory
    
    


Check product details
# ดึงลิงก์ของสินค้าทั้งหมด    
    ${product_elements}=    Get WebElements    xpath=//div[@class='inventory_item']
    ${product_count}=    Get Length    ${product_elements}

    Log To Console    จำนวนสินค้าที่ต้องตรวจสอบ: ${product_count}

    FOR    ${index}    IN RANGE    ${product_count}
        ${product_elements}=    Get WebElements    xpath=//div[@class='inventory_item']//a[@class='inventory_item_link']
        ${product_link}=    Get Element Attribute    ${product_elements}[${index}]    href
        
        # เปิดหน้าสินค้า
        Go To    ${product_link}
        Sleep     1s

        # ตรวจสอบชื่อสินค้า
        ${product_name}=    Get Text    xpath=//div[@class='inventory_details_name large_size']
        Log To Console    ตรวจสอบสินค้า: ${product_name}

        # ตรวจสอบรายละเอียดสินค้า
        ${product_desc}=    Get Text    xpath=//div[@class='inventory_details_desc large_size']
        Log To Console    รายละเอียดสินค้า: ${product_desc}

        # ตรวจสอบราคาสินค้า
        ${product_price}=    Get Text    xpath=//div[@class='inventory_details_price']
        Should Contain    ${product_price}    $    ราคาไม่ถูกต้อง!

        # ตรวจสอบว่ามีปุ่ม Add to Cart
        Element Should Be Visible    xpath=//button[contains(text(), 'Add to cart')]

        # กลับไปที่หน้า inventory เพื่อเช็คสินค้าถัดไป
        Go To    https://www.saucedemo.com/inventory.html
        Sleep     1s
    END