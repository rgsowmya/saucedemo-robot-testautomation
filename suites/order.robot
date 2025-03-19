*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/keywords.robot


*** Variables ***
${SHOPPING_CART}        id=shopping_cart_container
${LOGOUT}               id=logout_sidebar_link
${CART_ITEMS}           xpath://div[@class='cart_item']
${CHECKOUT_BTN}         checkout
${FIRST_NAME_TXT}       id=first-name
${LAST_NAME_TXT}        id=last-name
${POSTAL_CODE_TXT}      id=postal-code
${CONTINUE_BTN}         id=continue
${PAYMENT_INFO}         xpath://div[@class='summary_info_label' and @data-test='payment-info-label']
${SHIPPING_INFO}        xpath://div[@class='summary_info_label' and @data-test='shipping-info-label']
${PRICE_TOTAL}          xpath://div[@class='summary_info_label' and @data-test='total-info-label']
${PAYMENT_CARD}         xpath://div[normalize-space()='SauceCard #31337']
${SHIPPING_METHOD}      xpath://div[normalize-space()='Free Pony Express Delivery!']
${PRODUCT_1_PRICE}      xpath://div[@class='inventory_item_price'][1]
${PRODUCT_2_PRICE}      xpath://div[@class='inventory_item_price'][normalize-space()='$7.99']
${CART_TOTAL}           17.98
${FINISH_BTN}           id=finish
${TOTAL_PRICE}          xpath://div[@class='summary_total_label']
${SHOPPING_CART}        id=shopping_cart_container
${BACK_HOME_BTN}        id=back-to-products


*** Test Cases ***
Checkout Items
    Login to SauceDemo
    AddTwoItemsToCart
    Verify the items added in the cart
    Checkout the added items
    Add customer information
    Pay and close the order
    Verify Cart Total
    Calculate Total Price
    Finish the order
    Back to Home page
    Logout SauceDemo
    Close Browser


*** Keywords ***
Verify the items added in the cart
    # Verify two items in the cart
    ${cart_count}    Get Element Count    ${CART_ITEMS}
    Should Be Equal As Numbers    ${cart_count}    2    Cart does not contain exactly 2 items.
    Capture Page Screenshot    ../results/screenshots/order/count.png

    # Verify item names match expected values
    ${first_item_name}    Get Text    //div[normalize-space()='Sauce Labs Bike Light']
    ${second_item_name}    Get Text    //div[normalize-space()='Sauce Labs Onesie']

    Should Be Equal    ${first_item_name}    Sauce Labs Bike Light    First item does not match.
    Should Be Equal    ${second_item_name}    Sauce Labs Onesie    Second item does not match.

Checkout the added items
    # Verify thw checkout button is visible and enabled
    Page Should Contain Button    ${CHECKOUT_BTN}    Button not visible
    Element Should Be Enabled    ${CHECKOUT_BTN}
    Click Button    ${CHECKOUT_BTN}
    Capture Page Screenshot    ../results/screenshots/order/checkout.png

Add customer information
    Wait Until Page Contains    Checkout: Your Information    5s
    # Verify the firstname,lastname and zip code fields are enabled and visible
    Wait For Fields To Be Visible and Enabled    ${FIRST_NAME_TXT}    ${LAST_NAME_TXT}    ${POSTAL_CODE_TXT}

    # Input First Name, Last Name and Postal code using the custom keyword
    Input Multiple Fields    ${FIRST_NAME_TXT}    William    ${LAST_NAME_TXT}    Patrik    ${POSTAL_CODE_TXT}    0122
    Capture Page Screenshot    ../results/screenshots/order/customer_details.png

Pay and close the order
    # Verify the added items again in the checkout overview page
    Click Button    ${CONTINUE_BTN}
    Wait Until Page Contains    Checkout: Overview    5s
    Verify the items added in the cart
    Scroll Element Into View    ${FINISH_BTN}    # scroll to the bottom

    # Verify the payment details
    Wait For Element and Text
    ...    ${PAYMENT_INFO}
    ...    Payment Information:
    ...    ${SHIPPING_INFO}
    ...    Shipping Information:
    ...    ${PRICE_TOTAL}
    ...    Price Total
    Wait For Element and Text
    ...    ${PAYMENT_CARD}
    ...    SauceCard #31337
    ...    ${SHIPPING_METHOD}
    ...    Free Pony Express Delivery!

Calculate Total Price
    # Get price of product 1
    ${price_1_text}    Get Text    ${PRODUCT_1_PRICE}
    # Get price of product 2
    ${price_2_text}    Get Text    ${PRODUCT_2_PRICE}

    # Convert text to number
    ${price_1}    Convert To Number    ${price_1_text[1:]}    # Removing '$' sign
    ${price_2}    Convert To Number    ${price_2_text[1:]}    # Removing '$' sign

    # Calculate the total price
    ${calculated_total}    Evaluate    ${price_1} + ${price_2}
    RETURN    ${calculated_total}

Verify Cart Total
    ${calculated_total}    Calculate Total Price

    Log To Console    Calculated Total: ${calculated_total}
    Log To Console    Expected Cart Total: ${CART_TOTAL}

    # Verify that the calculated total matches the cart total
    Should Be Equal As Numbers    ${calculated_total}    ${CART_TOTAL}

Back to Home page
    # Go back to the home page
    Element Should Be Visible    ${BACK_HOME_BTN}    Back Home button is not visible
    Click Button    ${BACK_HOME_BTN}
    Wait Until Page Contains    Products    5s
    Capture Page Screenshot    ../results/screenshots/order/product_page.png
