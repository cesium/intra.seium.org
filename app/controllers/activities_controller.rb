class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :register, :deregister]

	def index
		@activities = Activity.all
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

		redirect_to activity_path
	end

	def deregister
		user = current_user
		
		if user.registered_at? @activity
			user.activities.delete @activity
		end

		redirect_to activity_path
	end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :description, :begin_date, :end_date, :type, :place)
    end
end
