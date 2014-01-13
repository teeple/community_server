@test15

Feature: Message Post
  # Scenario: 새로운 글을 등록하고 제대로 등록됨을 확인한다
  #   Given 가입자
  #     And 가입자가 Following하는 사용자
  #   When 새 글 등록 페이지 접속
  #     And 새 글 등록 
  #   Then 새 글이 등록되었습니다 메시지 확인
  #     And 친구로 접속
  #     And 새 글이 등록되었음을 확인
  #     And 글이 새글 표시가 되어 있음을 확인

  Scenario: 새로운 글을 등록했을 때 같은 존에 있는 사용자에게만 메시지를 전송한다
    Given 가입자
      And 가입자를 Following하는 같은 존에 있는 사용자
      And 가입자를 Following하는 같은 존에 없는 사용자
    When 새 글 등록 페이지 접속
      And 새 글 등록 
    Then 새 글이 등록되었습니다 메시지 확인
      And 같은 존에 있는 Follower만 메시지 수신