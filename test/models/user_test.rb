require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", email:"test.user@example.com", password: "secret1234", password_confirmation: "secret1234")
  end
  
  test "should be valid" do
    assert @user.valid?
  end

end
