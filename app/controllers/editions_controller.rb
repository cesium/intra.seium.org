class EditionsController < ApplicationController
  before_action :set_edition, only: [:show, :edit, :update, :destroy]

  def index
    @editions = Edition.all
    respond_with(@editions)
  end

  def show
		#if @edition.id == 2015
		#  render :file => 'public/sei_15_webpage/index.html', :layout => false
		#else
    #  respond_with(@edition)
		#end

		respond_with(@edition)
  end

  def new
    @edition = Edition.new
    respond_with(@edition)
  end

  def edit
  end

  def create
    @edition = Edition.new(edition_params)
    @edition.save
    respond_with(@edition)
  end

  def update
    @edition.update(edition_params)
    respond_with(@edition)
  end

  def destroy
    @edition.destroy
    respond_with(@edition)
  end

  private
    def set_edition
      @edition = Edition.find(params[:id])
    end

    def edition_params
      params.require(:edition).permit(:name, :edition_number, :description, :begin_date, :end_date)
    end
end
