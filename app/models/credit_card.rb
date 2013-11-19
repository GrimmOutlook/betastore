class CreditCard < ActiveRecord::Base

  attr_accessor :cardholder_name, :card_number, :exp_month, :exp_year

	def initialize(cardholder_name, card_number, exp_month, exp_year)
		@cardholder_name = cardholder_name
		@card_number = card_number
		@exp_month = exp_month
		@exp_year = exp_year
	end

end
