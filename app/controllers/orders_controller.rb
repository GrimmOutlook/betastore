class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end


  def index
	@page_title = "This is from the instance variable @page_title in the Orders Controller"
	render layout: 'dave'
  end



end