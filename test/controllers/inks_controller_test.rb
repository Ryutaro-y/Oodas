require "test_helper"

class InksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ink = inks(:one)
  end

  test "should get index" do
    get inks_url
    assert_response :success
  end

  test "should get new" do
    get new_ink_url
    assert_response :success
  end

  test "should create ink" do
    assert_difference('Ink.count') do
      post inks_url, params: { ink: { color_type: @ink.color_type, name: @ink.name } }
    end

    assert_redirected_to ink_url(Ink.last)
  end

  test "should show ink" do
    get ink_url(@ink)
    assert_response :success
  end

  test "should get edit" do
    get edit_ink_url(@ink)
    assert_response :success
  end

  test "should update ink" do
    patch ink_url(@ink), params: { ink: { color_type: @ink.color_type, name: @ink.name } }
    assert_redirected_to ink_url(@ink)
  end

  test "should destroy ink" do
    assert_difference('Ink.count', -1) do
      delete ink_url(@ink)
    end

    assert_redirected_to inks_url
  end
end
