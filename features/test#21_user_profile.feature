@tested

Feature: User Profile
  Scenario: User Profile 화면
    Given 가입자
      And Setting 페이지 접속
     When Submit 클릭
     Then 프로필 수정이 완료되었습니다 출력
