class OrdersController < ApplicationController
  skip_before_filter :require_log_in, only: [:new, :create]

  def new
    @order = Order.new
    Hash(session[:cart]).each do |pid, qty|
      @order.line_items.build(
        product_id: pid,
        quantity: qty)
    end
   
    @credit_card = CreditCard.new
    Array(session[:order]) do |chname, cnum, expm, expy|
      @order.build_credit_card(
        cardholder_name: chname,
        card_number: cnum.to_s,
        exp_month: expm,
        exp_year: expy)
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save && @credit_card.save
      redirect_to root_path, notice: 'Your order has been placed'
    else
      flash.now[:alert] = @order.errors.full_messages.join(', ')
      logger.error "errors: #{@order.errors.full_messages.join(', ')}"
      render 'new'
    end
  end

  protected
  def order_params
    params.require(:order).permit(line_items_attributes: [:product_id, :quantity])
    params.require(:credit_card).permit(credit_card_attributes: [:cardholder_name, :card_number, :exp_month, :exp_year])
  end
end
