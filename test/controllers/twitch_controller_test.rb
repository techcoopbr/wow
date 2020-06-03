require 'test_helper'

class TwitchControllerTest < ActionDispatch::IntegrationTest
  test "should get live" do
    get twitch_live_url
    assert_response :success
  end

end
