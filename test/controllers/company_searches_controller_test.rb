require "test_helper"

class CompanySearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get company_searches_new_url
    assert_response :success
  end

  test "should get show" do
    get company_searches_show_url
    assert_response :success
  end
end
