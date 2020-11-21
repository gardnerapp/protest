require 'test_helper'

class RebelControllerTest < ActionDispatch::IntegrationTest
  test '/signup should get rebel#new' do
    get signup_path
    assert_response :success
  end

end
