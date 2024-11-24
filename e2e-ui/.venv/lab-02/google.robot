*** Setting ***
Library    SeleniumLibrary

*** Test Cases ***
ทดสอบค้นหา ทุเรียน และตรวจสอบผลการค้นหา 12 เกร็ดความรู้ เรื่อง ทุเรียน ที่คนชอบกินทุเรียนควรรู้
    Open Browser    url=https://www.google.co.th/    browser=chrome
    Input Text    name=q    text=ทุเรียน
    Press Keys    None    RETURN
    Wait Until Page Contains    12 เกร็ดความรู้ เรื่อง ทุเรียน ที่คนชอบกินทุเรียนควรรู้


