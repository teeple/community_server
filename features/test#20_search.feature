@test20 

Feature: Search
  Scenario: 검색어에 해당하는 메시지 리스트를 확인한다
    Given 가입자
      And 검색어를 포함하는 글 리스트 생성
      And 검색어를 포함하지 않는 글 리스트 생성
     When 검색어 입력
      And 결과 글 리스트에서 검색어 포함 확인
      And 검색어를 포함하지 않는 결과 글 없음을 확인
