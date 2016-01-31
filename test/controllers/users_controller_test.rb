require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = users(:meatsim)
  end
  
  test "unauthorized user should be redirected to notice page" do
    sign_in @user
    get :index
    assert_redirected_to error_redirect_path
  end

end