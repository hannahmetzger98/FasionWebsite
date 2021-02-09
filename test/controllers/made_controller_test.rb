require 'test_helper'

class MadeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get made_index_url
    assert_response :success
  end

end
