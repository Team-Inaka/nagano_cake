require "application_system_test_case"

class Costomers::CartsTest < ApplicationSystemTestCase
  setup do
    @costomers_cart = costomers_carts(:one)
  end

  test "visiting the index" do
    visit costomers_carts_url
    assert_selector "h1", text: "Costomers/Carts"
  end

  test "creating a Cart" do
    visit costomers_carts_url
    click_on "New Costomers/Cart"

    fill_in "Costomer", with: @costomers_cart.costomer_id
    click_on "Create Cart"

    assert_text "Cart was successfully created"
    click_on "Back"
  end

  test "updating a Cart" do
    visit costomers_carts_url
    click_on "Edit", match: :first

    fill_in "Costomer", with: @costomers_cart.costomer_id
    click_on "Update Cart"

    assert_text "Cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart" do
    visit costomers_carts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart was successfully destroyed"
  end
end
