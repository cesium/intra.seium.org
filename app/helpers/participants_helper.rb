module ParticipantsHelper
  def hall_of_fame_title
    params[:action] == "hall_of_fame" ? t('hof'): t('oof')
  end

  def participant_badge_count(participant)
    participant.badge_acquisitions_count || 0
  end

  def hof_participant_image_profile_link(participant)
    link_to edition_participant_path(@edition, participant.username) do
      image_tag participant.avatar.url(:thumb),
        class: 'img-responsive img-circle img-hof'
    end
  end

  def participant_image_profile_link(participant)
    link_to edition_participant_path(@edition, participant.username) do
      image_tag participant.avatar.url(:thumb),
        class: 'img-responsive img-circle img-participant'
    end
  end

  def hof_participant_profile_link(participant)
    link_to participant.full_name,
      edition_participant_path(@edition, participant.username)
  end

  def participant_profile_link(participant)
    link_to participant.full_name.split.take(2).join(' '),
      edition_participant_path(@edition, participant.username)
  end
end
