require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
include SessionsHelper
  def setup
    @user = users(:mathilde)
  end

  test "should get home" do
    get home_path
    assert_response :success
  end

  test "get club page when logged in" do
    get home_path
    assert logged_in?
    get club_path
    assert_response :success
  end

  test "can't get club page when logout" do
    get home_path
    assert_not logged_in?
    get club_path
    assert_response :failed
  end

end


