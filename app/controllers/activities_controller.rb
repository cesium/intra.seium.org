class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :register, :deregister]

  def index
    begin_date = Date.new(@edition.begin_date.year, @edition.begin_date.month, (@edition.begin_date.day - 1))
    end_date = Date.new(@edition.end_date.year, @edition.end_date.month, @edition.end_date.day)
    @time_span = begin_date..end_date
    respond_with(@activities)
  end

  def show
    @participant = current_user
    respond_with(@activity)
  end

  def register
    user = current_user

    if !user.registered_at? @activity
      user.activities << @activity
    end

    redirect_to edition_activity_path(@edition, @activity).sub(/\d+\z/, @activity.url_escaped_name)
  end

  def deregister
    user = current_user

    if user.registered_at? @activity
      user.activities.delete @activity
    end

    redirect_to edition_activity_path(@edition, @activity).sub(/\d+\z/, @activity.url_escaped_name)
  end

  private
    def set_activity
      act =
        if params[:id].match(/\A[0-9]+\z/)
          Activity.find(params[:id])
        else
          Activity.where(url_escaped_name: CGI::escape(params[:id])).first
        end

      @activity =
        if act && act.edition == @edition
          act
        else
          nil
        end
    end

    def activity_params
      params.require(:activity).permit(:name, :description, :begin_date, :end_date, :type, :place)
    end
end
