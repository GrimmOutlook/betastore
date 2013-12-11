class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.order('placed_at' desc).page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end
end
