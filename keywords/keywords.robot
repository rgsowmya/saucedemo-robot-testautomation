*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com/
${BROWSER}        chrome
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${LOGIN}      id=login-button
${USERNAME_TXT}   id=user-name
${PASSWORD_TXT}   id=password
${HAMBURGER_ICON}   id=react-burger-menu-btn
${ADD_TO_CART_PRODUCT_1}   id=add-to-cart-sauce-labs-bike-light
${ADD_TO_CART_PRODUCT_2}   id=add-to-cart-sauce-labs-onesie
${REMOVE_BTN}      //button[@id='remove-sauce-labs-bike-light']
${SHOPPING_CART}    id=shopping_cart_container
${LOGOUT}   id=logout_sidebar_link
${FIRST_NAME_TXT}    id=first-name
${LAST_NAME_TXT}    id=last-name
${POSTAL_CODE_TXT}    id=postal-code
${FINISH_BTN}    id=finish
${COMPLETE_TXT}    //div[@class='complete-text']
${THANKYOU_TXT}    xpath=//h2[@class='complete-header']


*** Keywords ***
Login to SauceDemo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${USERNAME_TXT}    ${USERNAME}
    Input Text    ${PASSWORD_TXT}    ${PASSWORD}
    Click Button    ${LOGIN}
    Wait Until Page Contains    Products    5s

Logout SauceDemo
   #Logout application
    Wait Until Element Is Visible    ${HAMBURGER_ICON}    5s
    Click Button    ${HAMBURGER_ICON}
    Wait Until Element Is Visible    ${LOGOUT}    5s
    Click Element    ${LOGOUT}

AddTwoItemsToCart
    # Wait for the "Add to Cart" button to be visible and click it
    Wait Until Element Is Visible    ${ADD_TO_CART_PRODUCT_1}    10s
    Click Button    ${ADD_TO_CART_PRODUCT_1}

    # Wait for the "Remove" button to be visible (after item is added)
    Wait Until Element Is Visible    ${REMOVE_BTN}    10s
    Element Text Should Be    ${REMOVE_BTN}    Remove

    #Add another item to the cart
    Scroll Element Into View    ${ADD_TO_CART_PRODUCT_2}    #scroll to the bottom
    Click Button    ${ADD_TO_CART_PRODUCT_2}

    # Wait for the "Remove" button to be visible (after item is added)
    Wait Until Element Is Visible    ${REMOVE_BTN}    5s
    Element Text Should Be    ${REMOVE_BTN}    Remove
    Scroll Element Into View    ${SHOPPING_CART}    #scroll up to see items added
    Click Element    ${SHOPPING_CART}
    Wait Until Page Contains    Your Cart    3s

Wait For Fields To Be Visible and Enabled
    [Arguments]    @{elements}
    FOR    ${element}    IN    @{elements}
        Wait Until Element Is Visible    ${element}    5s    Elements not visible
        Wait Until Element Is Enabled    ${element}    5s    Elements not enabled
    END

Input Multiple Fields
    [Arguments]    @{fields_and_values}
    FOR    ${field}    ${value}    IN    @{fields_and_values}
        Input Text    ${field}    ${value}
    END


Wait For Element and Text
    [Arguments]    @{elements_and_texts}
    # Loop through each pair of locator and expected text
    FOR    ${locator}    ${expected_text}    IN    @{elements_and_texts}
        Wait Until Element Contains    ${locator}    ${expected_text}    5s
    END

Finish the order
    Click Button    ${FINISH_BTN}

    # Verify the page is navigated to the thankyou message
    Wait Until Page Contains    Checkout: Complete!    5s
    Wait Until Element Contains    ${THANKYOU_TXT}    Thank you for your order!    5s

    ${complete_order_text}    Get Text    ${COMPLETE_TXT}

    # verify the text in the final page
    Element Text Should Be    ${COMPLETE_TXT}    ${complete_order_text}


