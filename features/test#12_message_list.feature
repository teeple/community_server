@test12

Feature: Message List
  Scenario: 메시지 리스트가 보인 
    Given 가입자
      And Follower들이 남긴 글이 있다
     When 메시지 페이지 접속
     Then Follower들의 남긴 글이 보인다
