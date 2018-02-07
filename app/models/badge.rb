class Badge < ActiveRecord::Base
  belongs_to :edition
  belongs_to :activity

  belongs_to :parent, class_name: "Badge", foreign_key: :parent_id
  has_many :children, class_name: "Badge", foreign_key: :parent_id

  BadgeNotFoundError = Class.new(StandardError)
  CodesNotAllowedError = Class.new(StandardError)
  ExpirationDateExcedeedError = Class.new(StandardError)

  has_many :badge_acquisitions, dependent: :delete_all
  has_many :users, through: :badge_acquisitions
  has_attached_file :avatar, styles: {  medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/badge-missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def generate_codes(num_codes, status, code_expiration_date = nil)
    if is_code_needed
      (1..num_codes).each do
        code = CouponCode.generate(parts: 2) until code && BadgeAcquisition.where(code: code).empty?
        BadgeAcquisition.create(
          badge: self,
          code: code,
          status: status,
          code_expiration_date: code_expiration_date
        )
      end
    else
      raise CodesNotAllowedError.new
    end
  end

  def expired?
    expiration_date && DateTime.now > expiration_date
  end
end
