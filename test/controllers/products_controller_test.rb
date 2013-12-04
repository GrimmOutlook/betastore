require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
 
  test "index" do
    get :index
    assert_response :success
    puts @response.body
    assert_select "li a", products(:test).name
  end

  test "show" do
    get :show, id: products(:test).id
    assert_response :success

    assert_select "h1", text: 'Example', count: 1
    assert_select "h1", text: 'Other', count: 0
  end

  test "edit with valid id and token" do
    get :edit, id: password_resets(:test).id,
    token: password_reset(:test).token

  end

  test "edit with valid id and invalid token" do
     get :edit, id: password_resets(:test).id,
     token: 'fail'

  end


end 