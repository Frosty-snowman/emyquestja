Feature: User login
  For User can add new quest 
  So I can add new quest

  Scenario: can add new quest 
    Given 
    When ฉันไปที่หน้าเข้าสู่ระบบ
    And ฉันกรอกอีเมล "test@example.com"
    And ฉันกรอกรหัสผ่าน "password"
    And ฉันกดปุ่ม "เข้าสู่ระบบ"
    Then ฉันควรเห็นข้อความ "เข้าสู่ระบบสำเร็จ"
