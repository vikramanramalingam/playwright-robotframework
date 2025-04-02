*** Settings ***
Library    Browser
Library    Collections


*** Variables ***
${FIRSTNAME_FIELD}      id=customer.firstName
${LASTNAME_FIELD}       id=customer.lastName
${ADDRESS_FIELD}        id=customer.address.street
${CITY_FIELD}           id=customer.address.city
${STATE_FIELD}          id=customer.address.state
${ZIPCODE_FIELD}        id=customer.address.zipCode
${PHNO_FIELD}           id=customer.phoneNumber
${SSN_FIELD}            id=customer.ssn
${REG_USERNAME_FIELD}       xpath=//input[@name='customer.username']
${REG_PASSWORD_FIELD}       xpath=//input[@name='customer.password']
${CNF_PASSWORD_FIELD}   id=repeatedPassword
${REGISTER_BUTTON}      xpath=//input[@type='submit'][@value='Register']
${WELCOME_TEXT}         xpath=//div[@id='rightPanel']/h1[@class='title']


*** Keywords ***
Register New User
    [Arguments]    &{userData}
    Fill Text    ${FIRSTNAME_FIELD}      ${userData["first_name"]}
    Fill Text    ${LASTNAME_FIELD}       ${userData["last_name"]}
    Fill Text    ${ADDRESS_FIELD}        ${userData["address"]}
    Fill Text    ${CITY_FIELD}           ${userData["city"]}
    Fill Text    ${STATE_FIELD}          ${userData["state"]}
    Fill Text    ${ZIPCODE_FIELD}        ${userData["zipcode"]}
    Fill Text    ${PHNO_FIELD}           ${userData["phone_number"]}
    Fill Text    ${SSN_FIELD}            ${userData["ssn"]}
    Fill Text    ${REG_USERNAME_FIELD}   ${userData["username"]}
    Fill Text    ${REG_PASSWORD_FIELD}   ${userData["password"]}
    Fill Text    ${CNF_PASSWORD_FIELD}   ${userData["password"]}
    Click        ${REGISTER_BUTTON}

    Wait For Elements State    ${WELCOME_TEXT}    visible    10s



Get Welcome Text
    ${text}  Get Text    ${WELCOME_TEXT}
    RETURN    ${text}