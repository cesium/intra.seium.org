class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participant, only: [:show]

  def index
    @participants = User.all
  end

  def show
    @social = check_accounts
  end

  def hall_of_fame
    @participants = User.participants_with_badges
  end

  def organizer_of_fame
    @participants = User.organizers_with_badges
    render :hall_of_fame
  end

  private

  # Check if there are any social accounts
  def check_accounts
    ( @participant.facebook_account != nil && @participant.facebook_account != "" ) ||
    ( @participant.twitter_account != nil && @participant.twitter_account != "" ) ||
    ( @participant.github_account != nil && @participant.github_account != "" ) ||
    ( @participant.google_plus_account != nil && @participant.google_plus_account != "" )
  end

  def set_participant
    @participant = User.where(username: params[:username]).first
  end

  def user_params
    params.require(:participant).permit(:username, :email)
  end
end
