require 'test_helper'
include Devise::TestHelpers
class StaticControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "should get index" do
    get :index
    assert_select "title", "Home | Hackernotes"
    assert_select "h1", "Hackernotes"
    assert_select "a", "Notas"
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_select "title", "About | Hackernotes"
    assert_response :success
  end

end
