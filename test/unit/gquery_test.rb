require 'test_helper'

class GqueryTest < ActiveSupport::TestCase
  test "Gquery save" do
     query = Gquery.new
     assert !query.save, "Must have query, interval and user_id"
  end

end
