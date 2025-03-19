*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/keywords.robot


*** Variables ***
${URL}                      https://www.saucedemo.com/
${BROWSER}                  chrome
${USERNAME}                 standard_user
${PASSWORD}                 secret_sauce
${LOGIN}                    id=login-button
${USERNAME_TXT}             id=user-name
${PASSWORD_TXT}             id=password
${HAMBURGER_ICON}           id=react-burger-menu-btn
${SHOPPING_CART}            id=shopping_cart_container
${ADD_TO_CART_PRODUCT_1}    id=add-to-cart-sauce-labs-bike-light
${ADD_TO_CART_PRODUCT_2}    id=add-to-cart-sauce-labs-onesie
${REMOVE_BTN}               //button[@id='remove-sauce-labs-bike-light']
${LOGOUT}                   id=logout_sidebar_link


*** Test Cases ***
Add Items to the Cart
    Login to SauceDemo
    AddTwoItemsToCart
    Logout SauceDemo
    Close Browser


*** Keywords ***
AddTwoItemsToCart
    # Wait for the "Add to Cart" button to be visible and click it
    Wait Until Element Is Visible    ${ADD_TO_CART_PRODUCT_1}    10s
    Click Button    ${ADD_TO_CART_PRODUCT_1}
    Capture Page Screenshot    ../results/screenshots/cart/added_item_1_to_cart.png

    # Wait for the "Remove" button to be visible (after item is added)
    Wait Until Element Is Visible    ${REMOVE_BTN}    10s
    Element Text Should Be    ${REMOVE_BTN}    Remove

    # Add another item to the cart
    Scroll Element Into View    ${ADD_TO_CART_PRODUCT_2}    # scroll to the bottom
    Click Button    ${ADD_TO_CART_PRODUCT_2}
    Capture Page Screenshot    ../results/screenshots/cart/added_item_2_to_cart.png

    # Wait for the "Remove" button to be visible (after item is added)
    Wait Until Element Is Visible    ${REMOVE_BTN}    5s
    Element Text Should Be    ${REMOVE_BTN}    Remove
    Scroll Element Into View    ${SHOPPING_CART}    # scroll up to see items added
    Capture Page Screenshot    ../results/screenshots/cart/two_added_items.png
