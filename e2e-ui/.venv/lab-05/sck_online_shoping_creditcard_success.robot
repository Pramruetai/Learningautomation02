*** Setting ***
Library    SeleniumLibrary
Resource    ./resource.resource

*** Variable ***
${URL}    http://192.168.3.115:3000/product/list
${BROWSER}    gc

*** Test Cases ***
ทดสอบ สั่งซื้อสินค้าจัดส่งด้วยเคอรี่่ ชำระเงินด้วยบัตร visa สำเร็จ และตรวจสอบการได้แต้มสะสม
    ค้นหาสินค้าด้วย คำค้นหา    Bicycle
    ตรวจสอบผลการค้นหา    product-card-name-1    Balance Training Bicycle
    เลือกดูสินค้า    product-card-name-1      
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับ       product-detail-point     43 Points
    เพิ่ม Balance Training Bicycle ลงตะกร้า
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ Balance Training Bicycle ในตะกร้า  
    ใส่ที่อยู่จัดส่งสินค้า    
    ...    พงศกร
    ...    รุ่งเรืองทรัพย์
    ...    189/413 หมู่ 2
    ...    สมุทรปราการ
    ...    เมืองสมุทรปราการ
    ...    แพรกษาใหม่
    ...    shipping-form-zipcode-input    10280
    ...    0909127991    
    เลือกวิธีจัดส่งสินค้าเป็น Kerry
    ตรวจสอบค่าจัดส่งสินค้าของ Kerry เท่ากันกับ 50.00 บาท
    เลือกช่องทางการชำระเงินแบบ Credit card
    ตรวจสอบราคารวมที่ต้องชำระเงินต้องเท่ากันกับ 8,679.20 บาท
    ยืนยัน OTP
    ตรวจสอบหมายเลขพัสดุ
    ยืนยันการส่งการแจ้งเตือนด้วย email และ เบอร์โทรศัพท์


