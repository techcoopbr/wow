require 'test_helper'

class CreatorFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get creator_follows_create_url
    assert_response :success
  end

end
