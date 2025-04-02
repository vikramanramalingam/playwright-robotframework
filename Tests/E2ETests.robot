*** Settings ***
Library    ../Helper/TestDataHelper.py
Library    Browser
Resource   ../Pages/LoginPage.robot
Resource   ../Pages/RegisterPage.robot
Resource   ../Utils/ElementUtils.robot
Resource   ../Utils/ScreenshotUtils.robot

Suite Setup   Open Browser Context   browser=${BROWSER}   url=${URL}
Suite Teardown   Close Browser Context
Test Teardown    Run Keyword If    "${TEST STATUS}" != "PASS"    Capture Screenshot On Failure    ${TEST NAME}

*** Variables ***
${BROWSER}
${URL} 
${REGISTERED_USER}    None

*** Keywords ***
Open Browser Context
    [Arguments]    ${browser}    ${url}
    ${browser_instance}    New Browser    ${browser}    headless=true
    ${context}    New Context      recordVideo={"dir": 'videos' , "size": {'width':400, 'height':200}}     tracing=True
    ${page}    New Page    ${url}
    Set Global Variable    ${browser_instance}
    Set Global Variable    ${context}
    Set Global Variable    ${page}

Close Browser Context
    Close Browser


*** Test Cases ***
Verify user is not able to login with invalid credentials
    ${username}    Generate Username
    ${password}    Generate Password
    Login  username=${username}   password=${password}
    ${errorMessage}  Get Login Error
    Assert Text    ${errorMessage}    The username and password could not be verified.

Verify user is able to register a new user
    ${userData}    Generate User Data
    Click Register Link
    Register New User    &{userData}
    ${welcomeText}    Get Welcome Text
    Log    Welcome message: ${welcomeText}
    Assert Text    ${welcomeText}    Welcome ${userData["first_name"]} ${userData["last_name"]}
    Set Global Variable    ${REGISTERED_USER}    ${userData}

Verify user is able to logout with a registered user
    Click Logout
    Verify Login Button Is Present

Verify user is able to login again with a registered user
    Login    username=${REGISTERED_USER["username"]}    password=${REGISTERED_USER["password"]}
    Verify Logout Button Is Present