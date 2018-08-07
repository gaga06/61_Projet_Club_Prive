
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mathilde)
    @user2 = users(:thomas)
    @all_users = []
    @all_users << users(:mathilde)
    @all_users << users(:thomas)
  end

test "login with invalid information" do
    get login_path
     assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    get user_path(@user)
    assert_redirected_to login_path
    assert_not flash.empty?
  end

  test "login with valid information" do

  get login_path
  post login_path, params: { session: { email: @user.email,
                                        password: 'password' } }

  get root_path

  assert_no_match "a[href=?]", login_path
  assert_select "a[href=?]", logout_path
  assert_select "a[href=?]", user_path(@user)
end


  end

