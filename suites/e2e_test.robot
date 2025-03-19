*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/keywords.robot


*** Variables ***
${CHECKOUT_BTN}         checkout
${POSTAL_CODE_TXT}      id=postal-code
${CONTINUE_BTN}         id=continue
${PRODUCT_1_PRICE}      xpath://div[@class='inventory_item_price'][1]
${PRODUCT_2_PRICE}      xpath://div[@class='inventory_item_price'][normalize-space()='$7.99']
${CART_TOTAL}           17.98
${FINISH_BTN}           id=finish
${BACK_HOME_BTN}        id=back-to-products


*** Test Cases ***
Happy path e2e test
    Login to SauceDemo
    AddTwoItemsToCart
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
Checkout the added items
    Click Button    ${CHECKOUT_BTN}
    Capture Page Screenshot    ../results/screenshots/e2e_test/checkout.png

Add customer information
    Wait Until Page Contains    Checkout: Your Information    5s

    # Input First Name, Last Name and Postal code using the custom keyword
    Input Multiple Fields    ${FIRST_NAME_TXT}    William    ${LAST_NAME_TXT}    Patrik    ${POSTAL_CODE_TXT}    0122
    Capture Page Screenshot    ../results/screenshots/e2e_test/customer_details.png

Pay and close the order
    # Verify the added items again in the checkout overview page
    Click Button    ${CONTINUE_BTN}
    Wait Until Page Contains    Checkout: Overview    5s
    Scroll Element Into View    ${FINISH_BTN}    # scroll to the bottom

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
    Capture Page Screenshot    ../results/screenshots/e2e_test/product_page.png
