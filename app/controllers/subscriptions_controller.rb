class SubscriptionsController < ApplicationController
  skip_before_filter :require_log_in

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def create
    @subscription = Subscription.new(subscription_params)

      if @subscription.save
        redirect_to @subscription, notice: 'Subscription was successfully created.'
      else
        render action: 'new'
      end
    end

  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(:email)
  end



  end

