require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: 'example', last_name: 'LASTNAME', email: 'user@example.com', password: 'popopo', password_confirmation: 'popopo')
  end

   test "the truth" do
     assert true
   end

    test "should be valid" do
      assert @user.valid?, "user doit pouvoir s'enregistrer"
    end

#teste si le prenom est vide"
    test "first_name should be present" do
      @user.first_name=""
      assert_not @user.valid?
    end
#teste si le prenom contient des blancs"
      test "first_name should be present without blank space" do
      @user.first_name= " "
      assert_not @user.valid?
    end

    test "last_name should be present" do
      @user.last_name= " "
      assert_not @user.valid?
    end

    test "email should be present" do
      @user.email= " "
      assert_not @user.valid?
    end
#test pour qu'1 utilisateur ne puisse pas avoir le même email qu'un autre
# ou plus simplement l email doit être unique
    test "email should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end

end
