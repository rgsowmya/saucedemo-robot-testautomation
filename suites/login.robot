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
${LOGOUT}   id=logout_sidebar_link
@{USER_CREDENTIALS}  standard_user  secret_sauce  problem_user  secret_sauce

*** Test Cases ***
Login to SauceDemo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Element Should Be Visible   ${USERNAME_TXT}
    Element Should Be Enabled    ${USERNAME_TXT}
    Input Text    ${USERNAME_TXT}    ${USERNAME}
    Input Text    ${PASSWORD_TXT}    ${PASSWORD}
    Click Button    ${LOGIN}
    Wait Until Page Contains    Products    5s
    Capture Page Screenshot    ../results/screenshots/login/login.png
    Click Button    ${HAMBURGER_ICON}
    Wait Until Element Is Visible    ${LOGOUT}    3s
    Click Element    ${LOGOUT}

Login with MultipleUser
   Maximize Browser Window
   FOR    ${i}    IN RANGE    0    2    2
        Input Text    ${USERNAME_TXT}    ${USER_CREDENTIALS}[${i}]
        Input Text    ${PASSWORD_TXT}    ${USER_CREDENTIALS}[${i+1}]
        Click Button    ${LOGIN}
        Wait Until Page Contains    Products    5s
        Capture Page Screenshot    ../results/screenshots/login/multipleuser-login.png
        Click Button    ${HAMBURGER_ICON}
        Wait Until Element Is Visible    ${LOGOUT}    3s
        Click Element       ${LOGOUT}
    END
    Close Browser