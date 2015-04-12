require 'test_helper'

class SubControllerTest < ActionController::TestCase
  test "should get genres" do
    get :genres
    assert_response :success
  end

end
