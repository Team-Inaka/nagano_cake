require 'test_helper'

class CostomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get costomers_index_url
    assert_response :success
  end

  test "should get show" do
    get costomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get costomers_edit_url
    assert_response :success
  end

end
