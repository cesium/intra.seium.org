class ActivitiesController < ApplicationController
  before_action :set_edition
  before_action :set_activity, only: [:show, :register, :deregister]

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
			act	= 
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

		def set_edition
			@edition = Edition.find params[:edition_id]
		end

    def activity_params
      params.require(:activity).permit(:name, :description, :begin_date, :end_date, :type, :place)
    end
end
