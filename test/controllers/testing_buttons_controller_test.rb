require 'test_helper'

class TestingButtonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testing_button = testing_buttons(:one)
  end

  test "should get index" do
    get testing_buttons_url
    assert_response :success
  end

  test "should get new" do
    get new_testing_button_url
    assert_response :success
  end

  test "should create testing_button" do
    assert_difference('TestingButton.count') do
      post testing_buttons_url, params: { testing_button: {  } }
    end

    assert_redirected_to testing_button_url(TestingButton.last)
  end

  test "should show testing_button" do
    get testing_button_url(@testing_button)
    assert_response :success
  end

  test "should get edit" do
    get edit_testing_button_url(@testing_button)
    assert_response :success
  end

  test "should update testing_button" do
    patch testing_button_url(@testing_button), params: { testing_button: {  } }
    assert_redirected_to testing_button_url(@testing_button)
  end

  test "should destroy testing_button" do
    assert_difference('TestingButton.count', -1) do
      delete testing_button_url(@testing_button)
    end

    assert_redirected_to testing_buttons_url
  end
end
