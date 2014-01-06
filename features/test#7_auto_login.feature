@tested

Feature: Auto Login 
  Scenario: 새로운 가입자는 가입화면을 띄운다.
    Given 모든 가입자 삭제
    And 비가입자
    When 사용자 설정 페이지 접속
    Then 가입화면으로 이동

  Scenario: 로그인된 사용자가 설정 페이지 접속시 설정 페이지로 이동한다. 
    Given 로그인이 된 사용자
    When 사용자 설정 페이지 접속
    Then 사용자 설정 페이지로 이동

	Scenario: 쿠키를 지운 가입자가 설정 페이지 접속시 설정 페이지로 이동한다.
    Given 쿠키를 지운 가입자
    When 사용자 설정 페이지 접속
    Then 사용자 설정 페이지로 이동

	Scenario: 해당 존을 진출한 사용자가 진입 후 설정 페이지 접속시 설정 페이지로 이동한다.
    Given 존을 이탈한 가입자
    When 사용자 설정 페이지 접속
    Then 사용자 설정 페이지로 이동

	Scenario: 쿠키가 없고, 존을 진출한 사용자가 진입 후 설정 페이지 접속시 설정 페이지로 이동한다.
    Given 쿠키가 없고 존을 진출한 사용자
    When 사용자 설정 페이지 접속
    Then 사용자 설정 페이지로 이동
