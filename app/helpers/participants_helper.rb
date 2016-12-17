module ParticipantsHelper
  def hall_of_fame_title
    params[:action] == "hall_of_fame" ? "Hall Of Fame" : "Organizer Of Fame"
  end

  def participant_badge_count(participant)
    participant.badge_acquisitions_count || 0
  end
end
