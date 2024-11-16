*** Keywords ***
ค้นหาสินค้าด้วย คำค้นหา 
    [Arguments]    ${SEARCH}
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_experimental_option("detach", True)
    Input Text    id:search-product-input     ${SEARCH}
    Click Element    id:search-product-btn

ตรวจสอบผลการค้นหา 
    [Arguments]    ${CARD-NAME-LOCATOR}    ${RESULT}
    Wait Until Element Is Visible    id:${CARD-NAME-LOCATOR}   
    Element Should Contain    id=${CARD-NAME-LOCATOR}    ${RESULT}

เลือกดูสินค้า 
    [Arguments]    ${PRODUCTID}
    Click Element    id=${PRODUCTID}

ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับ 
    [Arguments]    ${detail-point-LOCATOR}    ${RESULT}
    Wait Until Element Is Visible    id:${detail-point-LOCATOR}
    Element Text Should Be    id=${detail-point-LOCATOR}    ${RESULT}

เพิ่ม Balance Training bicycle ลงตะกร้า
    Click Button    id=product-detail-add-to-cart-btn

ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ Balance Training bicycle ในตะกร้า
    Click Button    id=header-menu-cart-btn
    Wait Until Element Is Visible    id:product-1-point
    # Element Text Should Be    id=product-1-point    43 Points

ใส่ที่อยู่จัดส่งสินค้า
    [Arguments]    ${FIRST-NAME-LOCATOR}    ${LAST-NAME-LOCATOR}    ${ADDRESS-LOCATOR}
    ...    ${PROVINCE-LOCATOR}    ${DISTRICT-LOCATOR}
    ...    ${SUB-DISTRICT-LOCATOR}
    ...    ${ZIPCODE-Value}
    ...    ${MOBILE-LOCATOR}   
    Click Link    id=shopping-cart-checkout-btn
    Wait Until Element Is Visible    id:shipping-form-first-name-input
    Input Text    id=shipping-form-first-name-input     ${FIRST-NAME-LOCATOR}
    Input Text    id=shipping-form-last-name-input    ${LAST-NAME-LOCATOR}
    Input Text    id=shipping-form-address-input    ${ADDRESS-LOCATOR}  
    Select From List By Label    id=shipping-form-province-select    ${PROVINCE-LOCATOR} 
    Select From List By Label    id=shipping-form-district-select    ${DISTRICT-LOCATOR} 
    Select From List By Label    id=shipping-form-sub-district-select   ${SUB-DISTRICT-LOCATOR}
    Element Attribute Value Should Be    id:shipping-form-zipcode-input    Value    ${ZIPCODE-Value} 
    Wait Until Element Is Visible    id:shipping-form-mobile-input
    Input Text    id=shipping-form-mobile-input    ${MOBILE-LOCATOR} 

เลือกวิธีจัดส่งสินค้าเป็น Kerry
    Click Element    id=shipping-method-1-name

ตรวจสอบค่าจัดส่งสินค้าของ Kerry เท่ากันกับ 50.00 บาท
    Element Text Should Be    id=shipping-method-1-fee    ฿50.00

เลือกช่องทางการชำระเงินแบบ Credit card
    Click Element    id=payment-credit-input
    Input Text    id=payment-credit-form-fullname-input    พงศกร รุ่งเรืองทรัพย์
    Input Text    id=payment-credit-form-card-number-input    4719700591590995
    Input Text    id=payment-credit-form-expiry-input    02/26
    Input Text    id=payment-credit-form-cvv-input    752
    
ตรวจสอบราคารวมที่ต้องชำระเงินต้องเท่ากันกับ 8,679.20 บาท
    Element Should Be Visible    id=order-summary-total-payment-price

ยืนยัน OTP
    Click Button    id=payment-now-btn
    Wait Until Element Is Visible    id=otp-input    
    Click Button    Request OTP
    Wait Until Element Is Visible    id=otp-input 
    Input Text    id=otp-input    123456
    Click Button    PAY NOW

ตรวจสอบหมายเลขพัสดุ
    Wait Until Element Is Visible    id=order-success-tracking-id    
    Element Should Contain    id=order-success-tracking-id     KR-
    ${tracking-id}=    Get Text    id=order-success-tracking-id
    Should Match Regexp    ${tracking-id}    ^KR-\\d{9}$
    
ยืนยันการส่งการแจ้งเตือนด้วย email และ เบอร์โทรศัพท์
    Wait Until Element Is Visible    id=order-success-tracking-id
    Input Text    id=notification-form-email-input    ponsakorn@gmail.com
    Input Text    id=notification-form-mobile-input    0909127991        
    Select Checkbox    id=notification-form-in-application-input
    Click Button    id=send-notification-btn