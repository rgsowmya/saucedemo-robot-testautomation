*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                  https://www.saucedemo.com/
${BROWSER}              chrome
${INVALID_USERNAME}     invalid_user
${INVALID_PASSWORD}     invalid_pwd
${LOGIN}                id=login-button
${USERNAME_TXT}         id=user-name
${PASSWORD_TXT}         id=password
${LOGIN_INVALID_TXT}    xpath://*[@id="login_button_container"]/div/form/div[3]/h3/text()
${ERROR_MSG}            css=div.error-message-container h3
${EXPECTED_MSG}         Epic sadface: Username and password do not match any user in this service


*** Test Cases ***
Login With Invalid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${USERNAME_TXT}    ${INVALID_USERNAME}
    Input Text    ${PASSWORD_TXT}    ${INVALID_PASSWORD}
    Click Button    ${LOGIN}
    Wait Until Element Is Visible    ${ERROR_MSG}    5s
    ${actual_msg}=    Get Text    ${ERROR_MSG}
    Should Be Equal    ${actual_msg}    ${EXPECTED_MSG}
    Capture Page Screenshot    ../results/screenshots/validations/invalid_login.png
