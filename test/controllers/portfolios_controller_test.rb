require "test_helper"

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = User.first
    @token = @current_user.generate_jwt
    @portfolio = Portfolio.first
  end

  test "should get portfolio index" do
    get '/api/portfolios', headers: { "HTTP_AUTHORIZATION" => "Token token=#{@token}" }
    assert_response :success
  end

end
