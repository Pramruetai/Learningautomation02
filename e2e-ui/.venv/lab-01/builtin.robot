*** Test Cases ***
ทดสอบคำสั่ง Log to console
    Log To Console	Hello, console!

ทดสอบบวกเลข
    ${result}=    Evaluate    1 + 1
    Should Be Equal	    ${result}    ${2}
    Should Be Equal As Integers	    ${result}    2