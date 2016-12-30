class EditionsController < ApplicationController
  def show
    if @edition.id == 2016
      render :file => 'public/sei_15_webpage/index.html', :layout => false
    else
      respond_with(@edition)
    end
  end
end
