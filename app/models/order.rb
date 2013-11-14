class Order < ActiveRecord::Base
  belongs_to :customer, :credit_card
  has_many :line_items
  accepts_nested_attributes_for :line_items, :credit_card

#These lines didn't work for some reason:
# def sum
#  	sum = 0
#  	line_items.each do |line_item|
#      sum += line_items.total_price
#    end
#    sum
#  end

  def self.recent
    where("placed_at > ?", 7.days.ago)
  end

  def self.by(customer)
    where(customer_id: customer.id)
  end

  def total_price
    line_items.inject(0) |sum, li|
      li.total_price sum
    end
  end


end

