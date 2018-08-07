require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include SessionsHelper

   setup do
    @user = users(:mathilde)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end


  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end


  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
  end



  #test "login with valid information followed by logout" do
   # get login_path
    #post login_path, params: { session: { email:    @user.email,
                                          #password: 'password' } }
    #assert is_logged_in?
    #assert_redirected_to @user
    #follow_redirect!
    #assert_template 'users/show'
    #assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", user_path(@user)
    #delete logout_path
    #assert_not is_logged_in?
    #assert_redirected_to root_url
    #follow_redirect!
    #assert_select "a[href=?]", login_path
    #assert_select "a[href=?]", logout_path,      count: 0
    #assert_select "a[href=?]", user_path(@user), count: 0
  #end
end


