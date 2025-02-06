*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome

*** Keywords ***
I am on the Saucedemo login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

I log in with username "${username}" and password "${password}"
    Input Text    css=*[data-test="username"]    ${username}
    Input Text    css=*[data-test="password"]    ${password}
    Click Button    css=*[data-test="login-button"]

I add the "${item_name}" to the cart
    Click Button    css=*[data-test="add-to-cart-sauce-labs-bike-light"]

I go to the shopping cart
    Click Element    css=*[data-test="shopping-cart-link"]

I proceed to checkout
    Click Button    css=*[data-test="checkout"]

I enter my first name "${first_name}", last name "${last_name}", and postal code "${postal_code}"
    Input Text    css=*[data-test="firstName"]    ${first_name}
    Input Text    css=*[data-test="lastName"]    ${last_name}
    Input Text    css=*[data-test="postalCode"]    ${postal_code}

I continue to the overview page
    Click Button    css=*[data-test="continue"]

I finish the purchase
    Click Button    css=*[data-test="finish"]

I should see the message "${expected_message}"
    Element Text Should Be    css=*[data-test="complete-header"]    ${expected_message}