require 'json'

class Api::V1::DomainsControllerTest < ActionController::TestCase

  def setup
    super
    @user = create(:user)
  end

  test "should get access token" do
    request.env['HTTP_AUTHORIZATION'] = credentials
    get :access_token, { id: "ryandaigle.com" }
    assert_response :success
    assert_equal @response.body, JSON.generate("access_token" => @user.db_access_token)
  end

  test "should require authentication" do
    get :access_token, { id: "ryandaigle.com" }
    assert_response 401
    assert_not_equal @response.body, JSON.generate("access_token" => @user.db_access_token)
  end

  test "should require the right authentication" do
    request.env['HTTP_AUTHORIZATION'] = credentials("bad", "creds")
    get :access_token, { id: "ryandaigle.com" }
    assert_response 401
    assert_not_equal @response.body, JSON.generate("access_token" => @user.db_access_token)
  end

  test "only works for ryandaigle.com" do
    request.env['HTTP_AUTHORIZATION'] = credentials
    get :access_token, { id: "nope" }
    assert_response 404
  end

  def credentials(user = ENV["APP_API_USER"], password = ENV["APP_API_PASSWORD"])
    ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  end
end
