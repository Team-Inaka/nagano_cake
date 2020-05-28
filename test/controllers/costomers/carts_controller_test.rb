require 'test_helper'

class Costomers::CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @costomers_cart = costomers_carts(:one)
  end

  test "should get index" do
    get costomers_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_costomers_cart_url
    assert_response :success
  end

  test "should create costomers_cart" do
    assert_difference('Costomers::Cart.count') do
      post costomers_carts_url, params: { costomers_cart: { costomer_id: @costomers_cart.costomer_id } }
    end

    assert_redirected_to costomers_cart_url(Costomers::Cart.last)
  end

  test "should show costomers_cart" do
    get costomers_cart_url(@costomers_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_costomers_cart_url(@costomers_cart)
    assert_response :success
  end

  test "should update costomers_cart" do
    patch costomers_cart_url(@costomers_cart), params: { costomers_cart: { costomer_id: @costomers_cart.costomer_id } }
    assert_redirected_to costomers_cart_url(@costomers_cart)
  end

  test "should destroy costomers_cart" do
    assert_difference('Costomers::Cart.count', -1) do
      delete costomers_cart_url(@costomers_cart)
    end

    assert_redirected_to costomers_carts_url
  end
end
