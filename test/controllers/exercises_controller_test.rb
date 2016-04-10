require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get toggle" do
    get exercises_toggle_url
    assert_response :success
  end

end
