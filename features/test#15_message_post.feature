@test15
    Given 가입자
      And 가입자가 Following하는 사용자
    When 새 글 등록 페이지 접속
      And 새 글 등록 
    Then 새 글이 등록되었습니다 메시지 확인
      And 친구로 접속
      And 새 글이 등록되었음을 확인


Feature: Message Post
  Scenario: 새로운 글을 등록하고 제대로 등록됨을 확인한다
    Given 가입자
      And 가입자가 Following하는 사용자
    When 새 글 등록 페이지 접속
      And 새 글 등록 
    Then 새 글이 등록되었습니다 메시지 확인
      And 친구로 접속
      And 새 글이 등록되었음을 확인
      And 글이 새글 표시가 되어 있음을 확인

  Scenario: 특정 유효 기간 이후 해당 글이 읽은 글로 표시됨을 확인한
