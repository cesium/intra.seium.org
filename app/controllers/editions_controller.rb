class EditionsController < ApplicationController
  before_action :set_edition, only: [:show]

  def show
		if @edition.id == 2015
			render :file => 'public/sei_15_webpage/index.html', :layout => false
		else
			respond_with(@edition)
		end
  end

  private
    def set_edition
      @edition = Edition.find(params[:id])
    end
end
