require 'test_helper'

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get Venues" do
    get event_Venues_url
    assert_response :success
  end

end
