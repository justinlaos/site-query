require "test_helper"

class SpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = User.first
    @token = @current_user.generate_jwt
    @portfolio = Portfolio.first
    @site = Site.first
    @space = Space.first
  end

  test "should get sites index" do
    get "/api/portfolios/#{@portfolio.id}/sites/#{@site.id}/spaces", headers: { "HTTP_AUTHORIZATION" => "Token token=#{@token}" }
    assert_response :success
  end
end
