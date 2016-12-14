module ApplicationHelper
  def is_participants_active?
    is_active?(edition_participants_path(edition_id: @edition))
  end

  def is_badges_active?
    is_active?(edition_badges_path(edition_id: @edition))
  end

  def is_redeem_badge_active?
    is_active?(redeem_edition_badges_path(edition_id: @edition))
  end

  def is_profile_active?
   is_active?(edition_participant_path(username: current_user.username, edition_id: @edition))
  end

  private

  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
