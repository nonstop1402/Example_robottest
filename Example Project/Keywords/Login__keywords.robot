*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/Variable.robot   #เรียกใช้ตัวแปร

*** Keywords ***
# Login page ----------
Open and maximize browser
    Open browser    ${login_page}    Chrome
    Maximize Browser Window

Fill username
    [Arguments]    ${Username}
    Element Should Be Enabled    ${username_input}
    Input Text    ${username_input}    ${Username}

Fill password
    [Arguments]    ${Password}
    Element Should Be Enabled    ${password_input}
    Input Text    ${password_input}    ${Password}
        
Click Login 
    Element Should Be Enabled    ${login_btn}
    Click Element    ${login_btn}

#Inventory Page-----

Page should be inventory
    Wait Until Location Is    ${inventory_page}
    Location Should Be    ${inventory_page}
    Wait Until Element Is Visible    xpath=//div[@class='inventory_list']    timeout=5s


Title should be Products
    Wait Until Page Contains Element    xpath=//*[@id="header_container"]/div[2]/span
    Title Should Be    Products

# Cart page ----------

Page should be cart
    Wait Until Location Is    ${cart_page}
    Location Should Be    ${cart_page}
    Wait Until Page Contains      Your Cart


# Checkout page----------

Page should be Checkout
    Wait Until Location Is    ${checkout_page}
    Location Should Be    ${checkout_page}
    Wait Until Page Contains    Checkout: Your Information

Fill Firstname
    [Arguments]    ${firstname}
    Element Should Be Enabled    ${firstname_input}
    Input Text    ${firstname_input}    ${firstname}

Fill Lastname
    [Arguments]    ${lastname}
    Element Should Be Enabled    ${lastname_input}
    Input Text    ${lastname_input}    ${lastname}

Fill zipcode
    [Arguments]    ${zipcode}
    Element Should Be Enabled    ${zipcode_input}
    Input Text    ${zipcode_input}    ${zipcode}




    

    
    
