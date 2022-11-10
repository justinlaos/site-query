require "test_helper"

class SitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = User.first
    @token = @current_user.generate_jwt
    @portfolio = Portfolio.first
    @site = Site.first
  end

  test "should get sites index" do
    get "/api/portfolios/#{@portfolio.id}/sites", headers: { "HTTP_AUTHORIZATION" => "Token token=#{@token}" }
    assert_response :success
  end
end
