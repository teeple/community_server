class Spinach::Features::Demo < Spinach::FeatureSteps
	include CommonHelpers
 
  step '가입자' do
    clear_all_database
    # @user = get_test_user
  end

  step 'Follower가 있다' do
    # # 친구 - 일반인 
    # create_related_user_with_name_and_description "Suji", @user.id, false, "10", true, "안녕하세요~ 수지에요~ 흐흐흐흐"
    # create_related_user_with_name_and_description "JisungPark", @user.id, false, "11", true, "골을 넣어야 된다고 생각하기 때문에 국대 복귀는 아직 잘 모르기때문에"
    
    # # 친구 - Cafe
    # create_related_user_with_name_and_description "ABC_Mart", @user.id, true, "12", true, "ABC 마트에서 신발 사세요~ 제발..."
    # create_related_user_with_name_and_description "Homeplus", @user.id, true, "13", true, "홈플러스는 홈키퍼가 아닙니다."
  end

  step 'Not Follower가 있다' do
    # create_related_user_with_name_and_description "IU", @user.id, false, "14", false, "신봉선 아님"
    # create_related_user_with_name_and_description "Sam", @user.id, false, "15", false, "호주형이에요 흐흐흐"

    # create_related_user_with_name_and_description "Coffee_Prince", @user.id, true, "16", false, "드라마 제목 아니고 커피숍입니다."
    # create_related_user_with_name_and_description "Auto_Motors", @user.id, true, "17", false, "카센터라고 할까요?"
  end
end
