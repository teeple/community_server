Feature: Auto Login 
  Scenario: 새로운 가입자는 가입화면을 띄운다.
    Given 비가입자가 있다
    When 로그인 시도
    Then 가입화면으로 이동

  Scenario: 기존 가입자는 홈화면(전체 글 리스트)로 간다.
    Given 가입자가 있다
    When 로그인 시도
    Then 전체 글 리스트로 이동
 