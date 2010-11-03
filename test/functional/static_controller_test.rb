require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_select "title", "Home | Hackernotes"
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_select "title", "About | Hackernotes"
    assert_response :success
  end

end
