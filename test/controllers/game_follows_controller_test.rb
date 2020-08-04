require 'test_helper'

class GameFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get game_follows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get game_follows_destroy_url
    assert_response :success
  end

end
