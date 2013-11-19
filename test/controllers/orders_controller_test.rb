require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
 
  test "display checkout form" do
    get :new
    assert_response :success
    assert_select 'form'
    assert_select 'input[type=submit]'
  end

  test "redirect to homepage with notice" do
    post :create
    assert_redirected_to  root_path
    assert_equal "Your order has been placed", flash[:notice]
  end

  test "credit card info correct" do
    get :new
    assert_redirected_to  root_path
    assert_equal "Your order has been placed", flash[:notice]
  end



end

