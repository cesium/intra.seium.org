class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :description, :address, :is_partner, :partnership_type, :web_site, :facebook_account, :twitter_account, :github_account, :google_plus_account, :logo_url)
    end
end
