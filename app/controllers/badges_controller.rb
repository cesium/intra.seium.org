class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge, only: [:show]
  load_and_authorize_resource except: [:require, :redeem]

  def index
    @badges = @edition.badges.order(name: :asc)
    respond_with(@badges)
  end

  def show
    @badge_show_action = true
    respond_with(@badge)
  end

  def require
  end

  def new
    @parent_options = Badge.where(is_code_needed: false).collect{|p| [p.codename, p.id]}
    @badge = Badge.new
  end

  def create
    # Set badge edition_id to the current edition id.
    params[:badge][:edition_id] = @edition.id

    if Badge.new(badge_params).save
      redirect_to edition_badges_path, notice: "Badge added with success."
    else
      redirect_to edition_badges_path, alert: "Error adding badge."
    end
  end

  def redeem
    code = params[:code]
    @redeem_action = true
    begin
      @badges = BadgeAcquisition.acquire_badge_with_code(current_user, code)
      User.reset_badge_counters(current_user)
    rescue BadgeAcquisition::AcquisitionError => e
      @error = e
    end
  end

  def edit
  end

  def update
    if @badge.update_attributes(badge_params)
      redirect_to edition_badge_path(@edition.id, @badge), notice: "Badge added with success."
    else
      render 'edit'
    end
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :codename, :description, 
                                    :badge_type, :is_code_needed,
                                    :edition_id, :avatar, :parent_id)
    end
end
