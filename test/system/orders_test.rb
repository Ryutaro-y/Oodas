require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Ink name", with: @order.ink_name
    fill_in "Order date", with: @order.order_date
    fill_in "Order quantity", with: @order.order_quantity
    fill_in "Supplier id", with: @order.supplier_id_id
    fill_in "User id", with: @order.user_id_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Ink name", with: @order.ink_name
    fill_in "Order date", with: @order.order_date
    fill_in "Order quantity", with: @order.order_quantity
    fill_in "Supplier id", with: @order.supplier_id_id
    fill_in "User id", with: @order.user_id_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
