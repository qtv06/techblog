require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get posts_home_url
    assert_response :success
  end

  test "should get show" do
    get posts_show_url
    assert_response :success
  end

end
