require "test_helper"

class Public::RelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get public_relationship_followings_url
    assert_response :success
  end

  test "should get followers" do
    get public_relationship_followers_url
    assert_response :success
  end
end
