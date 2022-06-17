require "test_helper"

class LessonControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get lesson_hello_url
    assert_response :success
  end
end
