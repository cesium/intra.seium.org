module ParticipantsHelper
  def hall_of_fame_title
    params[:action] == "hall_of_fame" ? t('hof'): t('oof')
  end

  def participant_badge_count(participant)
    participant.badge_acquisitions_count || 0
  end

  def participant_image_profile_link(participant)
    link_to edition_participant_path(@edition, participant.username) do
      image_tag participant.avatar.url, class: 'img-responsive img-circle participant-img'
    end
  end

  def participant_profile_link(participant)
    link_to participant.full_name,
      edition_participant_path(@edition, participant.username)
  end
end
