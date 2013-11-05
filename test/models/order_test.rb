require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "an order placed yesterday is returned by recent" do
    order = orders(:yesterday)
    assert Order.recent.where(id: order.id).exists?
  end

  test "an order placed 10 days ago is not returned by recent" do
  	order = orders(:ten_days_ago)
  	assert !Order.recent.where(id: order.id).exists?
  end

end
