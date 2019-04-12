require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search_author" do
    get :search_author
    assert_response :success
  end

  test "should get search_article" do
    get :search_article
    assert_response :success
  end

end
