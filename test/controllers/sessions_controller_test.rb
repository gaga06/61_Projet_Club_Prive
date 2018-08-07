require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
include SessionsHelper
def setup
      @user = users(:mathilde)
    end

  test "should get new" do
    get login_path
    assert_response :success
  end


end

