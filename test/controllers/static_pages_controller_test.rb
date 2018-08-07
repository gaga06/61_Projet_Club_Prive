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

# test qui fonctionne, possible d'aller sur la page club à partir de la static-page home
  test "get club page when logged in" do
    get club_path
  end



end


