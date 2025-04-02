*** Keywords ***
Assert Text
    [Arguments]    ${actual_text}    ${expected_text}
    Should Be Equal As Strings    ${actual_text}    ${expected_text}    msg=Expected text: '${expected_text}', but got: '${actual_text}'