require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup do
    @user = users(first_name: 'example', last_name: 'LASTNAME', email: 'user@example.com', password_digest: 'popopo')
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password_digest: @user.password_digest } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password_digest: @user.password_digest } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

  test "should be valid" do
    assert @user.valid?
    end

    test "first_name should be present" do
      @user.first_name= " "
      assert_not @user.valid
    end


  #test "first_name should no be blank"



  #end
end
