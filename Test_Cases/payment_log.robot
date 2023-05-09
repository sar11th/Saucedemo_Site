*** Settings ***
Library           SeleniumLibrary
Resource    D:/PycharmProjects/testing/project/saucedemo_project/Resources/objectrepostory.robot
*** Variables ***
${browser}        headlessChrome
${url}            https://www.saucedemo.com/
${checkouturl}    https://www.saucedemo.com/checkout-step-one.html
${general_user}    standard_user
${password}       secret_sauce
${PRODUCT_1}      Sauce Labs Backpack
${PRODUCT_2}      Sauce Labs Bike Light
${PRODUCT_1_PRICE}    $29.99
${PRODUCT_2_PRICE}    $9.99
${PRODUCT_1_QTY}      1
${PRODUCT_2_QTY}      1
${firstname}    Helna
${lastname}    Predis
${zipcode}    897296
${item_total}    $39.98
${tax}    $3.20
${grand_total}    $43.18
${timeout}         10s
${lastname_error}    Error: Last Name is required
${firstname_error}    Error: First Name is required
${postalcode_error}    Error: Postal Code is required
*** Test Cases ***
Verify Login With Invalid User And Valid Password

    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    invalid_user
    Enter Password    ${password}

    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Valid User And Invalid Password

    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    standard_user
    Enter Password    invalid_password
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Valid User And Empty Password
    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    standard_user
    Enter Password    ${EMPTY}
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Empty User And Valid Password
    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    ${EMPTY}
    Enter Password    ${password}
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Empty User And InValid Password
    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    ${EMPTY}
    Enter Password    jhjfkhdjh
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Empty User And Empty Password
    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    ${EMPTY}
    Enter Password    ${EMPTY}
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Wrong User And Empty Password
    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}

    Enter Username    jfsdhj
    Enter Password    ${EMPTY}
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With Wrong User And Wrong Password
    set selenium speed    1s
    [Tags]    logingtest
    Start Browser and Maximize    ${url}    ${browser}
    Maximize Browser Window
    Enter Username    jfsdhj
    Enter Password    sdgsg
    Click Submit
    Error message should be visible    ${timeout}
    Close Browser

Verify Login With All Usernames And Passwords
    Set Selenium Speed    1s
    [Tags]    logingtest
    @{usernames}    Create List    standard_user    locked_out_user    problem_user    performance_glitch_user
    ${user_count}    Get Length    ${usernames}
    FOR    ${index}    IN RANGE    ${user_count}
        ${username}=    Set Variable    ${usernames[${index}]}
        log to console    ${username}
        Start Browser and Maximize    ${url}    ${browser}
        Enter Username    ${username}
        Enter Password    ${password}
        Click Submit
#        Dashboard should contain    ${timeout}
        Close Browser
#        IF    '${username}' == 'standard_user'
#            Log To Console    Login successful for user ${username}
#        END
    END
    Log To Console    All logins verified

Login With General User And Valid Password
    set selenium speed    1s
    [Tags]    generallogingtest
    Start Browser and Maximize    ${url}    ${browser}
    Enter Username    ${general_user}
    Enter Password    ${password}
    Click Submit
    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    https://www.saucedemo.com/inventory.html
    Dashboard should contain    ${timeout}
    Display Page

Filter Products By Price
    [Tags]    filterproducts
    Click Element    ${filter_product}
    sleep    3s

Add To Cart

    set selenium speed    1s
    [Tags]    addtocart
#    Go To  ${https://www.saucedemo.com/inventory.html}
    Click Element    ${cart_items}
    Cart Page Contains
    Page Should Contain Element    ${remove_button}

Removing the Cart Items
    [Tags]    addtocart
    Remove Cart Items
    Continue Shopping
    Click Element    ${cart_items}
    Click Element    ${sauce_labs_jacket}
    click element    ${back_to_products}
    Click Element    ${add_to_cart}
    Cart Page Contains
    Verify Prodcuts Added to cart Page
#    Page Should Contain Element    xpath://div[@id='inventory_item_name' and contains(text(),'Sauce Labs Backpack')]
#    Page Should Contain Element    xpath://div[@id='inventory_item_name' and contains(text(),'Sauce Labs Bike Light')]
    Page Should Contain Element     ${remove_sauce}

Checkout Page
    set selenium speed    1s
    [Tags]    checkout
    click element    ${checkout}
    Checkout Page Should Contains
    click element    ${checkout_cancel}
    click element    ${checkout}

Checkoutform with all empty fields
    set selenium speed    1s
    [Tags]    checkoutvalidation
    Enter checkout form firstname    ${EMPTY}
    Enter checkout form lastname    ${EMPTY}
    Enter checkout form zipcode    ${EMPTY}
    click element    ${checkout_continue}
    Error Mesage For CheckoutPage  ${firstname_error}
#    ${message}=    Get Text   ${error_checkout}
#    log to console    ${message}
#    Should Contain    ${message}    ${lastname_error}
    click element    ${checkout_cancel}


Checkoutform with Firstname is Not Empty
    set selenium speed    1s
    [Tags]    checkoutvalidation
    click element    ${checkoutbutton_visible}
    Enter checkout form firstname    ${firstname}
    Enter checkout form lastname    ${EMPTY}
    Enter checkout form zipcode    ${EMPTY}
    click element    ${checkout_continue}
    Error Mesage For CheckoutPage    ${lastname_error}

#    ${message}=    Get Text   ${error_checkout}
#    log to console    ${message}
#    Should Contain    ${message}    ${firstname_error}
    click element    ${checkout_cancel}

Checkoutform with Lastname is Not Empty
    set selenium speed    1s
    [Tags]    checkoutvalidation
    click element    ${checkoutbutton_visible}
    Enter Checkout Form Firstname    ${EMPTY}
    Enter Checkout Form Lastname    ${lastname}
    Enter Checkout Form Zipcode    ${EMPTY}
    click element    ${checkout_continue}
    sleep    3s
    Error Mesage For CheckoutPage    ${firstname_error}
    click element    ${checkout_cancel}


Checkoutform with Firstname and Lastname is Not Empty
    set selenium speed    1s
    [Tags]    checkoutvalidation
    click element    ${checkoutbutton_visible}
    Enter checkout form firstname    ${firstname}
    Enter checkout form lastname    ${lastname}
    Enter checkout form zipcode    ${EMPTY}
    click element    ${checkout_continue}
    sleep    3s
    Error Mesage For CheckoutPage    ${postalcode_error}

    click element    ${checkout_cancel}

Checkoutform with zipcode is not empty
    [Tags]    checkoutvalidation
#    [Arguments]    ${zipcode}
    click element    ${checkoutbutton_visible}
#    Wait Until Page Contains Element    ${checkoutform_zipcode}    timeout=10s
    Enter Checkout Form Firstname    ${EMPTY}
    Enter Checkout Form Lastname    ${EMPTY}
    Enter Checkout Form Zipcode    ${zipcode}
    Click Element    ${checkout_continue}
    Error Mesage For CheckoutPage    ${firstname_error}
    click element    ${checkout_cancel}

#    Error Message Should Be Visibles    10s
Checkout form with all fields are not empty
    Set Selenium Speed    3s
    [Tags]    checkoutvalidation
    click element    ${checkoutbutton_visible}
    Wait Until Page Contains Element    ${checkoutform_firstname}
    Enter Checkout Form Firstname    ${firstname}
    Wait Until Page Contains Element    ${checkoutform_lastname}
    Enter Checkout Form Lastname    ${lastname}
    Wait Until Page Contains Element    ${checkoutform_zipcode}
    Enter Checkout Form Zipcode    ${zipcode}
    Click Element    ${checkout_continue}
    sleep    3s

Payment Page Should Contains
    [Tags]    paymentpage
    set selenium speed    1s
    Checkout Payment Page
    Verify Prodcuts Added to cart Page

Checkout Compelete
    [Tags]    checkoutcomplete
    set selenium speed    1s
    click element    ${checkout_finish}
    Checkout Complete Page
    click button    ${back_to_products}
    close browser


*** Keywords ***

Start Browser and Maximize
    [Documentation]   This keyword is used for start browser and maximize its window
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${Title}=    Get Title
    [Return]    ${Title}

Enter Username
    [Arguments]    ${username}
    Wait Until Page Contains Element    ${username_textbox}
    Input Text    name=user-name    ${username}

Enter Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    ${password_textbox}
    Input Text    name=password    ${password}

Click Submit
    Click Element    ${loginbutton}

Error message should be visible
    [Arguments]    ${timeout}
    Wait Until Page Contains Element    ${error_message}
Dashboard should contain
    [Arguments]    ${timeout}
    Wait Until Page Contains Element    ${dashboard_contain_swaglabs}
    Wait Until Page Contains Element    ${dashboard_contain_products}

Display Page
#    set selenium speed    1s
    Wait Until Page Contains Element    ${display_page_inven}
    Log    Successfully waited for inventory list element
    sleep    3s
    click element    ${display_page_menu}
    Log    Successfully clicked on burger menu button
    sleep    3s
    Wait Until Page Contains Element    ${display_page_nav}
    Log    Successfully waited for inventory sidebar link
    sleep    3s
    Wait Until Page Contains Element    ${All_Items_link}
    Log    Successfully waited for All Items link
    sleep    3s
    Wait Until Page Contains Element    ${About_link}
    Log    Successfully waited for About link
    sleep    3s
    Wait Until Page Contains Element    ${Logout_link}
    Log    Successfully waited for Logout link
    sleep    3s
    Wait Until Page Contains Element    ${Reset_App_Link}
    Log    Successfully waited for Reset App State link
    sleep    3s
    click element    ${close_menu}
    Log    Successfully clicked on close button
    Wait Until Page Contains Element    ${sauce_labs_visible}
    Log    Sauce Labs Backpack element is visible
    sleep    3s
    Wait Until Page Contains Element    ${inventory_item_descrip}
    Log    Successfully waited for inventory item description
    sleep    3s
    Wait Until Page Contains Element    ${inventory_item_price}
    Log    Successfully waited for inventory item price
    sleep    3s
    Click Element    ${click_saucelabs}
    sleep    3s
    Wait Until Page Contains Element    ${add_to_cart_visible}
    sleep    3s
    Element Should Be Visible    ${inventory_details_container}
    sleep    3s
    Wait Until Page Contains Element    ${sauce_labs_pack}    Sauce Labs Backpack
    sleep    3s
    Wait Until Page Contains Element    ${carry}    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.

Remove Cart Items
    set selenium speed    1s
    click element   ${remove_button}

Continue Shopping
    set selenium speed    1s
    click element    ${continue_shopping_button}

Filter Products By Price
    Click Element    ${filter_products_price}
    sleep    3s

Verify Prodcuts Added to cart Page
    ${product_1_name} =    Get Text    ${product1_names}
#    log to console    ${product_1_name}
#    log to console    ${product1_names}
    ${product_2_name} =    Get Text    ${product2_names}
    ${product_1_price} =   Get Text    ${product1_prices}
    ${product_2_price} =   Get Text    ${product2_prices}
    ${product_1_qty} =     Get Text    ${product1_qtys}
    ${product_2_qty} =     Get Text    ${product2_qtys}
    Should Be Equal As Strings    ${product_1_name}    ${PRODUCT_1}
    Should Be Equal As Strings    ${product_2_name}    ${PRODUCT_2}
    Should Be Equal As Strings    ${product_1_price}    ${PRODUCT_1_PRICE}
    Should Be Equal As Strings    ${product_2_price}    ${PRODUCT_2_PRICE}
    Should Be Equal As Strings    ${product_1_qty}     ${PRODUCT_1_QTY}
    Should Be Equal As Strings    ${product_2_qty}     ${PRODUCT_2_QTY}

Cart Page Contains
#    Go To  ${https://www.saucedemo.com/cart.html}
    Element Should Be Visible    ${element_visible}
    Click Element    ${click_shoppingcart_link}
    Location Should Be    https://www.saucedemo.com/cart.html
    Wait Until Page Contains Element    ${dashboard_contain_swaglabs}
    Page Should Contain Element    ${visible_cart}
    ${contains}=    Page Should Contain Element    ${Qty_Visible}
    log to console    ${contains}
    ${contain}=    Page Should Contain Element    ${Description}
    log to console    ${contain}
    Page Should Contain Element    ${cart_quantity}
    Page Should Contain Element    ${continue_shopping_button}
    Page Should Contain Element    ${checkoutbutton_visible}

Checkout Page Should Contains
    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    https://www.saucedemo.com/checkout-step-one.html
    Wait Until Page Contains Element    ${dashboard_contain_swaglabs}
    Wait Until Page Contains Element    ${checkoutdashboard_contains}

    ${cartquantity}=    Get Text    ${shopping_cartquantity}
    log to console    ${cartquantity}
    Wait Until Page Contains Element    ${display_page_menu}
    Wait Until Page Contains Element    ${click_shoppingcart_link}
    Wait Until Page Contains Element    ${firstname_checkout}
    Wait Until Page Contains Element    ${lastname_checkout}
    Wait Until Page Contains Element    ${zipcode_checkout}
    Wait Until Page Contains Element    ${checkout_cancel}
    Wait Until Page Contains Element    ${checkout_continue}

Enter Checkout Form Firstname
    [Arguments]    ${firstname}
    Wait Until Page Contains Element    ${checkoutform_firstname}
    Input Text    ${checkoutform_firstname}    ${firstname}

Enter Checkout Form Lastname
    [Arguments]    ${lastname}
    Wait Until Page Contains Element    ${checkoutform_lastname}
    Input Text    ${checkoutform_lastname}    ${lastname}

Enter Checkout Form Zipcode
    [Arguments]    ${zipcode}
    Wait Until Page Contains Element    ${checkoutform_zipcode}
    Input Text    ${checkoutform_zipcode}    ${zipcode}

#Error Message Should Be Visibles
#    [Arguments]    ${timeout}
#    Wait Until Page Contains Element    xpath=//div[@class='error-message-container error']    timeout=${timeout}

Error Mesage For CheckoutPage
    [Arguments]    ${expected_message}
    Sleep    3s
    ${message}=    Get Text    xpath://h3[@data-test='error']
    Log To Console    Actual:${message}
    Log To Console    Expected:${expected_message}
    Should Contain    ${message}    ${expected_message}
#    IF  "${message}" == "${expected_message}"
#        Log To Console   Pass: Error message is correct
#    ELSE
#        Log To Console    Fail: Error message is incorrect. Expected: ${expected_message}, Actual: ${message}
#        # or you can also use the BuiltIn library's 'Fail' keyword:
#        # Fail    Error message is incorrect. Expected: ${expected_message}, Actual: ${message}
#    END

Checkout Payment Page

    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    https://www.saucedemo.com/checkout-step-two.html

    Wait Until Page Contains Element    ${dashboard_contain_swaglabs}
#    Page Should Contain Element    ${checkoutdashboard_contains}

    Wait Until Page Contains Element    ${checkout_step_two_checkoutoverview}
    ${cartquantity}=    Get Text    ${shopping_cartquantity}
    log to console    ${cartquantity}
    Wait Until Page Contains Element    ${display_page_menu}
    Wait Until Page Contains Element    ${click_shoppingcart_link}
    Page Should Contain Element    ${Qty_Visible}
    Page Should Contain Element    ${Description}

    Page Should Contain Element    ${Payment_Information}
    Page Should Contain Element    ${SauceCard}
    Page Should Contain Element    ${shipping_information}
    Page Should Contain Element    ${Free_Pony}
    Page Should Contain Element    ${Price_Total}
    ${item_total}=    Get Text    ${summary_subtotal_label}
    Log To Console    ${item_total}
    ${tax}=    Get Text    ${summary_tax_label}
    Log To Console    ${tax}
    ${grand_total}=    Get Text    ${summary_total_label}
    Log To Console    ${grand_total}
    ${item_total}=    Evaluate    ${item_total.replace('Item total: $', '')}
    ${tax}=    Evaluate    ${tax.replace('Tax: $', '')}
    ${grand_total}=    Evaluate    ${grand_total.replace('Total: $', '')}
    Log To Console    Item total: ${item_total}, Tax: ${tax}, Grand total: ${grand_total}
    ${total_amount}=    Evaluate    ${item_total} + ${tax}
    Should Be Equal As Strings    ${total_amount}    ${grand_total}

    Page Should Contain Element    ${checkout_cancel}
    Page Should Contain Element    ${checkout_finish}


Checkout Complete Page
    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    https://www.saucedemo.com/checkout-complete.html
    Wait Until Page Contains Element    ${dashboard_contain_swaglabs}
    Page Should Contain Element    ${checkout_complete}
    Page Should Contain Element    ${shoppingcart_link}
#    ${cartquantity}=    Get Text    xpath://span[@class='shopping_cart_badge']
#    log to console    ${cartquantity}
    Wait Until Page Contains Element    ${display_page_menu}
    Page Should Contain Element    ${payment_image}
    Page Should Contain Element    ${thankyou_order}
    Page Should Contain Element    ${order_dispacthed}
    Page Should Contain Element    ${back_home}












