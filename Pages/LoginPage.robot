*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${USERNAME_FIELD}      xpath=//input[@name='username']
${PASSWORD_FIELD}      xpath=//input[@name='password']
${LOGIN_BUTTON}        xpath=//input[@type='submit'][@value='Log In']
${LOGIN_ERROR}         xpath=//div[@id='rightPanel']/p[@class='error']
${REGISTER_LINK}       css=#loginPanel a:has-text('Register')
${LOGOUT_BUTTON}       xpath=//div[@id='leftPanel']/descendant::li/a[text()='Log Out']

*** Keywords ***

Click Register Link
    Click    ${REGISTER_LINK}

Enter Credentials
    [Arguments]    ${username}    ${password}
    Fill Text    ${USERNAME_FIELD}    ${username}
    Fill Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click    ${LOGIN_BUTTON}

Login
    [Arguments]    ${username}    ${password}
    Enter Credentials    ${username}    ${password}
    Click Login Button

Get Login Error
    Wait For Elements State    ${LOGIN_ERROR}    visible
    ${error_text} =    Get Text    ${LOGIN_ERROR}
    RETURN    ${error_text}

Click Logout
    Click    ${LOGOUT_BUTTON}

Verify Login Button Is Present
    ${is_present} =    Get Element States    ${LOGIN_BUTTON}
    RETURN    ${is_present} == "visible"

Verify Logout Button Is Present
    Wait For Elements State    ${LOGOUT_BUTTON}    visible
    ${is_present} =    Get Element States    ${LOGOUT_BUTTON}
    RETURN    ${is_present} == "visible"
