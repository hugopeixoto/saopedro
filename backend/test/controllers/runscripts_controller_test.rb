require 'test_helper'

class RunscriptsControllerTest < ActionController::TestCase
  test "listing zero runscripts" do
    get :index
    assert_response :ok
  end
end
