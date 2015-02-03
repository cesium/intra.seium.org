class BadgesController < ApplicationController
	respond_to :html

  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
    respond_with(@badges)
  end

  def show
    respond_with(@badge)
  end

  def new
    @badge = Badge.new
    respond_with(@badge)
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.save
    respond_with(@badge)
  end

  def update
    @badge.update(badge_params)
    respond_with(@badge)
  end

  def destroy
    @badge.destroy
    respond_with(@badge)
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :description)
    end
end
