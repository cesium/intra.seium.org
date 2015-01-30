class SpeakersController < ApplicationController
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]

  def index
    @speakers = Speaker.all
    respond_with(@speakers)
  end

  def show
    respond_with(@speaker)
  end

  def new
    @speaker = Speaker.new
    respond_with(@speaker)
  end

  def edit
  end

  def create
    @speaker = Speaker.new(speaker_params)
    @speaker.save
    respond_with(@speaker)
  end

  def update
    @speaker.update(speaker_params)
    respond_with(@speaker)
  end

  def destroy
    @speaker.destroy
    respond_with(@speaker)
  end

  private
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    def speaker_params
      params.require(:speaker).permit(:name, :email, :photo_url, :biography, :facebook_account, :twitter_account, :github_account, :google_plus_account)
    end
end
