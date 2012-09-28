require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User save" do
    user = User.new
    assert !user.save, "Must have email and password,"
  end
end
