class AddTrackingNumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :tracking_num, :integer
  end
end
