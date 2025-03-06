*** Variables ***

${browser}    chrome

# Pages    
${login_page}        https://www.saucedemo.com/
${inventory_page}    https://www.saucedemo.com/inventory.html
${cart_page}         https://www.saucedemo.com/cart.html
${checkout_page}     https://www.saucedemo.com/checkout-step-one.html
${checkout2_page}    https://www.saucedemo.com/checkout-step-two.html
${checkoutcomplete_page}    https://www.saucedemo.com/checkout-complete.html

# Login Page
${username_input}    id=user-name
${password_input}    id=password
${login_btn}         id=login-button

# Inventory Page
${logout_btn}        //*[@id="logout_sidebar_link"]
${menu_btn}          //button[@id='react-burger-menu-btn']
${menu_list}         //div[@class='bm-menu']
${hamburger_btn}     //*[@id="react-burger-menu-btn"]
${cart_btn}          //*[@id="shopping_cart_container"]/a

# cartpage
${yourcart_txt}      //*[@id="header_container"]/div[2]/span
${continueshopping_btn}      //*[@id="continue-shopping"]
${checkout_btn}      //*[@id="checkout"]

#Checkoutpage
${firstname_input}    //*[@id="first-name"]
${lastname_input}     //*[@id="last-name"]
${zipcode_input}      //*[@id="postal-code"]
${continue_btn}       //*[@id="continue"]
${check_info_btn}     //*[@id="header_container"]/div[2]/span
${cancel_btn}         //*[@id="cancel"]

# Checkoutstep two
${finish_btn}         //*[@id="finish"]
${total_txt}          //*[@id="checkout_summary_container"]/div/div[2]/div[8]


# Checkout complete
${backhome_page}      //*[@id="back-to-products"]