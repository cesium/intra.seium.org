class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :register, :deregister]
  before_action :set_edition

	def index
		@activities = @edition.activities
		respond_with(@activities)
	end

  def show
		@user = current_user
    respond_with(@activity)
  end

	def register
		user = current_user
		
		if !user.registered_at? @activity
			user.activities << @activity
		end

		redirect_to edition_activity_path(@edition, @activity)
	end

	def deregister
		user = current_user
		
		if user.registered_at? @activity
			user.activities.delete @activity
		end

		redirect_to edition_activity_path(@edition, @activity)
	end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

		def set_edition
			@edition = Edition.find params[:edition_id]
		end

    def activity_params
      params.require(:activity).permit(:name, :description, :begin_date, :end_date, :type, :place)
    end
end
