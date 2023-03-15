require "application_system_test_case"

class InksTest < ApplicationSystemTestCase
  setup do
    @ink = inks(:one)
  end

  test "visiting the index" do
    visit inks_url
    assert_selector "h1", text: "Inks"
  end

  test "creating a Ink" do
    visit inks_url
    click_on "New Ink"

    fill_in "Color type", with: @ink.color_type
    fill_in "Name", with: @ink.name
    click_on "Create Ink"

    assert_text "Ink was successfully created"
    click_on "Back"
  end

  test "updating a Ink" do
    visit inks_url
    click_on "Edit", match: :first

    fill_in "Color type", with: @ink.color_type
    fill_in "Name", with: @ink.name
    click_on "Update Ink"

    assert_text "Ink was successfully updated"
    click_on "Back"
  end

  test "destroying a Ink" do
    visit inks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ink was successfully destroyed"
  end
end
