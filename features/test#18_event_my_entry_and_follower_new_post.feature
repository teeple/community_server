@test18

Feature: Event My Entry
  Scenario: Followee진입 시 Follower들의 새글 알림
    Given Followee가 있다
      And Follower중 몇 명의 새글이 있다
      And Follower중 몇 명은 새글이 없다
     When Followee가 존에 진입
     Then 새글이 있는 Follower들의 알림 메시지가 전송된다


