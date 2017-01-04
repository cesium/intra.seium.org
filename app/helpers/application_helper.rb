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

  def page_title
    "SEI#{@edition.id.to_s.byteslice(2,4)} :: Intranet"
  end

  def is_organizer?
    user_signed_in? && current_user.is_organizer
  end

  private

  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
