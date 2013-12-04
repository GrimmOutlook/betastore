class Admin::DashboardController < ApplicationController
  def index
  	sql = %{
    select date(placed_at), count(*), sum(total_amount)
    from orders
    where placed_at > '#{30.days.ago}'
    group by date(placed_at)
    order by date(placed_at)}
<<<<<<< HEAD
    @days = Order.connection.select_rows(sql).map do |row|
      [row[0], row[1].to_i, row[2].to_f]
    end
=======
    @days = Order.connection.select_rows(sql)
>>>>>>> 58cc2b87b0d5c08c77ba8b3098b17669f6c5def3
  end
end
