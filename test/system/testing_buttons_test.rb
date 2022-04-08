require "application_system_test_case"

class TestingButtonsTest < ApplicationSystemTestCase
  setup do
    @testing_button = testing_buttons(:one)
  end

  test "visiting the index" do
    visit testing_buttons_url
    assert_selector "h1", text: "Testing Buttons"
  end

  test "creating a Testing button" do
    visit testing_buttons_url
    click_on "New Testing Button"

    click_on "Create Testing button"

    assert_text "Testing button was successfully created"
    click_on "Back"
  end

  test "updating a Testing button" do
    visit testing_buttons_url
    click_on "Edit", match: :first

    click_on "Update Testing button"

    assert_text "Testing button was successfully updated"
    click_on "Back"
  end

  test "destroying a Testing button" do
    visit testing_buttons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testing button was successfully destroyed"
  end
end
