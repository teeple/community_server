@test10 @tested

Feature: User List
  Scenario: Follower 리스트 
    Given 가입자
      And Not Follower 가 여러 명 있다
      And Cafe 가 여러 명 있다
      And Follower 가 여러 명 있다
     When User 페이지 접속
     Then Follower 리스트가 보인다

  # Scenario: Not Follower 리스트 
  #   Given 가입자
  #     And Not Follower 가 여러 명 있다
  #    When User 페이지 접속
  #     And Not Follower 탭 클릭
  #    Then Not Follower 리스트가 보인다

  # Scenario: Cafe 리스트 
  #   Given 가입자
  #     And Cafe 가 여러 명 있다
  #    When User 페이지 접속
  #     And Cafe 탭 클릭
  #    Then Cafe 리스트가 보인다
     