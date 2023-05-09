*** Variables ***

${username_textbox}    xpath://input[@id='user-name']

${password_textbox}    xpath://input[@id="password"]

${loginbutton}    xpath://input[@id="login-button"]

${error_message}    xpath=//div[@class='error-message-container error']



#filter products

${filter_product}    xpath=//select[@data-test='product_sort_container']/option[@value='lohi']



${dashboard_contain_swaglabs}    xpath://div[contains(@class, 'app_logo') and contains(text(),'Swag Labs')]

${dashboard_contain_products}    xpath://span[contains(@class, 'title') and contains(text(),'Products')]

${display_page_inven}    xpath://div[@class='inventory_list']

${display_page_menu}    xpath://button[@id='react-burger-menu-btn']

${display_page_nav}    xpath://nav[contains(@class, 'bm-item-list')]

${All_Items_link}    xpath:"//nav[@class='bm-item-list'] /a[@id='inventory_sidebar_link' ]"
${About_link}    xpath:"//nav[@class='bm-item-list'] /a[@id='about_sidebar_link' ]"
${Logout_link}    xpath:"//a[contains(text(), 'Logout')]"
${Reset_App_Link}    xpath:"//a[contains(text(), 'Reset App State')]"
${close_menu}    xpath://button[@id='react-burger-cross-btn']
${sauce_labs_visible}    xpath:"//div[contains(@class,'inventory_item_name') and contains(text(),'Sauce Labs Backpack')]"

${inventory_item_descrip}    xpath:"//div[contains(@class,'inventory_item_desc') and contains(text(),'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.')]"

${inventory_item_price}    xpath:"//div[contains(@class,'inventory_item_price') and contains(text(),'$29.99')]"
${click_saucelabs}    xpath:"//a[contains(text(),'Sauce Labs Backpack')]"
${add_to_cart_visible}    xpath://button[text()='ADD TO CART']
${inventory_details_container}    xpath://div[@class='inventory_details_container']

${sauce_labs_pack}    xpath://div[@class='inventory_details_name' and text()='Sauce Labs Backpack']

${carry}    xpath://div[@class='inventory_item_desc' and text()='carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.']

#Add_To_Cart

${remove_button}    xpath://button[@id="remove-sauce-labs-onesie"]
${continue_shopping_button}    xpath://button[@id="continue-shopping"]
${filter_products_price}    xpath=//select[@data-test='product_sort_container']/option[@value='hilo']


#Removing Cart Items
${cart_items}    xpath://div[@class='inventory_item'][1]//button[text()='Add to cart']
${sauce_labs_jacket}    xpath://div[@class='inventory_item_name' and contains(text(),'Sauce Labs Fleece Jacket')]
${back_to_products}    xpath://button[@id='back-to-products']
${add_to_cart}    xpath://div[@class='inventory_item'][2]//button[text()='Add to cart']
${remove_sauce}    xpath://button[@id='remove-sauce-labs-backpack']

#Checkout Page
${checkout}    xpath://button[@id='checkout' and contains(text(), 'Checkout')]



#verify products added to cart
${product1_names}    xpath://div[@class='cart_item_label'][1]/a[@id='item_4_title_link']/div[@class='inventory_item_name']
${product2_names}    xpath://div[@class='cart_item_label'][1]/a[@id='item_0_title_link']/div[@class='inventory_item_name']
${product1_prices}    xpath://div[normalize-space()='$29.99']
${product2_prices}    xpath://div[normalize-space()='$9.99']
${product1_qtys}    xpath://div[@class='cart_item'][1]/div[@class='cart_quantity']
${product2_qtys}    xpath://div[@class='cart_item'][2]/div[@class='cart_quantity']

#cart page should contains
${element_visible}    xpath://div[@class='shopping_cart_container']
${click_shoppingcart_link}    xpath://a[@class='shopping_cart_link']
#${location_should}=

${visible_cart}    xpath://span[contains(text(),'Your Cart')]
${Qty_Visible}    xpath://div[@class='cart_list']/div[@class='cart_quantity_label' and contains(text(),'QTY')]
${Description}    xpath://div[@class='cart_list']/div[@class='cart_desc_label' and contains(text(),'Description')]
${cart_quantity}    xpath://div[@class='cart_quantity']
${checkoutbutton_visible}    xpath://button[@id='checkout']

#Checkout Page Should Contains
${checkoutdashboard_contains}    xpath://div[@class='header_secondary_container']/span[@class='title' and contains(text(),'Checkout: Your Information')]
${shopping_cartquantity}    xpath://span[@class='shopping_cart_badge']
${firstname_checkout}    xpath://input[@id="first-name"]
${lastname_checkout}    xpath://input[@id="last-name"]
${zipcode_checkout}    xpath://input[@id="postal-code"]
${checkout_cancel}    xpath://button[@id="cancel"]
${checkout_continue}    xpath://input[@id='continue']

#Enter checkoutform firstname
${checkoutform_firstname}    xpath://input[@name='firstName']
#Enter checkoutform lastname
${checkoutform_lastname}    xpath://input[@name='lastName']
#Enter checkoutform zipcode
${checkoutform_zipcode}    xpath://input[@name='postalCode']

#Checkout Payment Page
${checkout_step_two_checkoutoverview}    xpath://div[@class='header_secondary_container']/span[@class='title' and contains(text(),'Checkout: Overview')]
${Payment_Information}    xpath://div[@class='summary_info_label' and contains(text(),'Payment Information')]
${SauceCard}    xpath://div[@class='summary_value_label' and contains(text(),'SauceCard #31337')]
${shipping_information}    xpath://div[@class='summary_info_label' and contains(text(),'Shipping Information')]
${Free_Pony}    xpath://div[@class='summary_value_label' and contains(text(),'Free Pony Express Delivery!')]
${Price_Total}    xpath://div[@class='summary_info_label' and contains(text(),'Price Total')]
${summary_subtotal_label}    xpath://div[@class='summary_subtotal_label']
${summary_tax_label}    xpath://div[@class='summary_tax_label']
${summary_total_label}    xpath://div[@class='summary_info_label summary_total_label']
${checkout_finish}    xpath://button[@id="finish"]

#Checkout Complete Page

${checkout_complete}    xpath://span[@class='title' and contains(text(),'Checkout: Complete!')]
${shoppingcart_link}    xpath://div[@id='shopping_cart_container']/a[@class='shopping_cart_link']
${payment_image}    xpath://div[@id='checkout_complete_container']/img[@class='pony_express']
${thankyou_order}    xpath://div[@id='checkout_complete_container']/h2[@class='complete-header' and contains(text(),'Thank you for your order!')]
${order_dispacthed}    xpath://div[@class='complete-text' and contains(text(),"Your order has been dispatched, and will arrive just as fast as the pony can get there!")]
${back_home}    xpath://button[@id='back-to-products' and contains(text(),'Back Home')]

${error_checkout}    xpath://h3[@data-test='error']