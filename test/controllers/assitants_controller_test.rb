require "test_helper"

class AssitantsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get assitants_dashboard_url
    assert_response :success
  end
end
