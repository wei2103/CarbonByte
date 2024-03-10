require "test_helper"

class EducationControllerTest < ActionDispatch::IntegrationTest
  test "should get educational_content" do
    get education_educational_content_url
    assert_response :success
  end
end
