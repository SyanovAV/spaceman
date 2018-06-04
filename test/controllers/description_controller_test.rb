require 'test_helper'

class DescriptionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get description_index_url
    assert_response :success
  end

end
