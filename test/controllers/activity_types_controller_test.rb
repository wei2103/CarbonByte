require "test_helper"

class ActivityTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get activity_types_show_url
    assert_response :success
  end
end
