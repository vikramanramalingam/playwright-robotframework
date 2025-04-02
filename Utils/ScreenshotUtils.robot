*** Settings ***
Library    Browser
Library    OperatingSystem
Library    AllureLibrary

*** Variables ***
${SCREENSHOT_DIR}    ${OUTPUTDIR}/browser/screenshot

*** Keywords ***
Capture Screenshot On Failure
    [Arguments]    ${test_name}=${TEST NAME}
    ${source_path}    Set Variable    ${SCREENSHOT_DIR}/${test_name}.png
    Take Screenshot    filename=${source_path}    fullPage=True
    Attach Screenshot To Allure Report    ${source_path}

Attach Screenshot To Allure Report
    [Arguments]    ${file_path}
    Attach File    ${file_path}    name=Screenshot
