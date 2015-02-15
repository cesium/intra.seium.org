require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { address: @company.address, description: @company.description, facebook_account: @company.facebook_account, github_account: @company.github_account, google_plus_account: @company.google_plus_account, is_partner: @company.is_partner, logo_url: @company.logo_url, name: @company.name, partnership_type: @company.partnership_type, twitter_account: @company.twitter_account, web_site: @company.web_site }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { address: @company.address, description: @company.description, facebook_account: @company.facebook_account, github_account: @company.github_account, google_plus_account: @company.google_plus_account, is_partner: @company.is_partner, logo_url: @company.logo_url, name: @company.name, partnership_type: @company.partnership_type, twitter_account: @company.twitter_account, web_site: @company.web_site }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
