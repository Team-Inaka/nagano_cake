require 'test_helper'

class Costomers::CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @costomers_cart_item = costomers_cart_items(:one)
  end

  test "should get index" do
    get costomers_cart_items_url
    assert_response :success
  end

  test "should get new" do
    get new_costomers_cart_item_url
    assert_response :success
  end

  test "should create costomers_cart_item" do
    assert_difference('Costomers::CartItem.count') do
      post costomers_cart_items_url, params: { costomers_cart_item: {  } }
    end

    assert_redirected_to costomers_cart_item_url(Costomers::CartItem.last)
  end

  test "should show costomers_cart_item" do
    get costomers_cart_item_url(@costomers_cart_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_costomers_cart_item_url(@costomers_cart_item)
    assert_response :success
  end

  test "should update costomers_cart_item" do
    patch costomers_cart_item_url(@costomers_cart_item), params: { costomers_cart_item: {  } }
    assert_redirected_to costomers_cart_item_url(@costomers_cart_item)
  end

  test "should destroy costomers_cart_item" do
    assert_difference('Costomers::CartItem.count', -1) do
      delete costomers_cart_item_url(@costomers_cart_item)
    end

    assert_redirected_to costomers_cart_items_url
  end
end
