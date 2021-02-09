require 'test_helper'

class MadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @made = mades(:one)
  end

  test "should get index" do
    get mades_url
    assert_response :success
  end

  test "should get new" do
    get new_made_url
    assert_response :success
  end

  test "should create made" do
    assert_difference('Made.count') do
      post mades_url, params: { made: { content: @made.content, user_id: @made.user_id } }
    end

    assert_redirected_to made_url(Made.last)
  end

  test "should show made" do
    get made_url(@made)
    assert_response :success
  end

  test "should get edit" do
    get edit_made_url(@made)
    assert_response :success
  end

  test "should update made" do
    patch made_url(@made), params: { made: { content: @made.content, user_id: @made.user_id } }
    assert_redirected_to made_url(@made)
  end

  test "should destroy made" do
    assert_difference('Made.count', -1) do
      delete made_url(@made)
    end

    assert_redirected_to mades_url
  end
end
