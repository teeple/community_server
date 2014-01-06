Feature: Sign Up
  Scenario: 전화번호 미입력
    Given 비가입자
      And 가입페이지 접속
      And 전화번호 미입력 
     When 회원가입 클릭
     Then 가입페이지에서 머무름
      And 전화번호를 입력하세요 출력
  
  Scenario: 아이디 미입력
    Given 비가입자
      And 가입페이지 접속
      And 아이디 미입력 
     When 회원가입 클릭
     Then 가입페이지에서 머무름
      And 아이디를 입력하세요 출력      

  Scenario: 형식에 맞지 않는 전화번호 입력
    Given 비가입자
      And 가입페이지 접속
      And 형식에 맞지 않는 전화번호 입력 
     When 회원가입 클릭
     Then 가입페이지에서 머무름
      And 형식에 맞지 않는 전화번호 입니다 출력 

  Scenario: 형식에 맞지 않는 아이디 입력
    Given 비가입자
      And 가입페이지 접속
      And 형식에 맞지 않는 아이디 입력 
     When 회원가입 클릭
     Then 가입페이지에서 머무름
      And 형식에 맞지 않는 아이디 입니다 출력 

  Scenario: 중복된 전화번호 입력
    Given 모든 가입자 삭제
      And 가입자
      And 가입페이지 접속
      And 중복된 전화번호 입력 
     When 회원가입 클릭
     Then 가입페이지에서 머무름
      And 중복된 전화번호 입니다 출력 
  
  Scenario: 중복된 아이디 입력
    Given 모든 가입자 삭제
      And 가입자
      And 가입페이지 접속
      And 중복된 아이디 입력 
     When 회원가입 클릭
     Then 가입페이지에서 머무름
      And 중복된 아이디 입니다 출력 

  Scenario: 가입처리
    Given 모든 가입자 삭제
      And 비가입자
      And 가입페이지 접속
      And 아이디, 전화번호 입력 
     When 회원가입 클릭
     Then 사용자 설정 페이지로 이동
      And 가입을 축하합니다 출력 

  