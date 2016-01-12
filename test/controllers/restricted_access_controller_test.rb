require 'test_helper'

class RestrictedAccessControllerTest < ActionController::TestCase
  test "should get restricted_user" do
    get :restricted_user
    assert_response :success
  end

end
