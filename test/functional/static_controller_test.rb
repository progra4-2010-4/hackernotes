require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "h1", :text => "Hackernotes"
    assert_select "a", :text => "Notas"
  end

end
