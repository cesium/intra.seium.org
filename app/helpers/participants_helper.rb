module ParticipantsHelper
  def hall_of_fame_title
    params[:action] == "hall_of_fame" ? t('hof'): t('oof')
  end

  def participants_hof?
    params[:action] == "hall_of_fame"
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

  def participant_linked_in_link(participant)
    handler = participant.linked_in_account
    link_to handler, 'https://www.linkedin.com/in/'.concat(handler)
  end

  def participant_github_link(participant)
    handler = participant.github_account
    link_to handler , 'https://www.github.com/'.concat(handler)
  end

  def participant_twitter_link(participant)
    handler = participant.twitter_account
    if handler[0] == ("@")
      handler.slice!(0)
    end
    link_to '@'.concat(handler), 'https://www.twitter.com/'.concat(handler)
  end

  def participant_facebook_link(participant)
    handler = participant.facebook_account
    link_to handler, 'https://www.facebook.com/'.concat(handler)
  end
end
