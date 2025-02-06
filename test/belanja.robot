*** Settings ***
Library    SeleniumLibrary
Library    WebDriverManager
Resource    ../resources/checkout_keywords.robot

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${FIRST_NAME}    dde
${LAST_NAME}    dede
${POSTAL_CODE}    909090

*** Test Cases ***
User Should Be Able To Complete Purchase
    [Documentation]    User logs in, adds an item to the cart, completes the purchase.
    [Tags]    shopping
    I am on the Saucedemo login page
    I log in with username "${USERNAME}" password "${PASSWORD}"
    I add the "Sauce Labs Bike Light" to the cart
    I go to the shopping cart
    I proceed to checkout
    I enter my first name "${FIRST_NAME}", last name "${LAST_NAME}", postal code "${POSTAL_CODE}"
    I continue to the overview page
    I finish the purchase
    Then I should see the message "Thank you for your order!"

*** Keywords ***
I am on the Saucedemo login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

I log in with username "${username}" password "${password}"
    Input Text    css=*[data-test="username"]    ${username}
    Input Text    css=*[data-test="password"]    ${password}
    Click Button    css=*[data-test="login-button"]

I add the "${item_name}" to the cart
    Click Button    css=*[data-test="add-to-cart-sauce-labs-bike-light"]

I go to the shopping cart
    Click Element    css=*[data-test="shopping-cart-link"]

I proceed to checkout
    Click Button    css=*[data-test="checkout"]

I enter my first name "${first_name}", last name "${last_name}", postal code "${postal_code}"
    Input Text    css=*[data-test="firstName"]    ${first_name}
    Input Text    css=*[data-test="lastName"]    ${last_name}
    Input Text    css=*[data-test="postalCode"]    ${postal_code}

I continue to the overview page
    Click Button    css=*[data-test="continue"]

I finish the purchase
    Click Button    css=*[data-test="finish"]

I should see the message "${expected_message}"
    Element Text Should Be    css=*[data-test="complete-header"]    ${expected_message}