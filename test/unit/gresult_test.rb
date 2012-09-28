require 'test_helper'

class GresultTest < ActiveSupport::TestCase
  test "Google result save" do
    result = Gresult.new
    assert !result.save, "Must have url and title"
  end
end
