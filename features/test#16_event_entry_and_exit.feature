@test16

Feature: Event Entry Exit
  Scenario: Follower 진입 시 알림 
    Given Followee가 있다
      And Follower가 여러명 있다
     When Followee가 존에 진입
     Then Followee들에게 진입알림 메시지가 전송된다

  Scenario: Follower 이탈 시 알림 
    Given Followee가 있다
      And Follower가 여러명 있다
     When Followee가 존에서 이탈
     Then Followee들에게 이탈알림 메시지가 전송된다