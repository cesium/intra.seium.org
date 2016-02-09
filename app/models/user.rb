class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: {  medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/avatar-missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_and_belongs_to_many :activities
	has_and_belongs_to_many :editions

  has_many :badge_acquisitions
  has_many :badges, through: :badge_acquisitions

	after_save :update_account_badges

	UserNotFoundError = Class.new(StandardError)
	UserIsAlreadyAnOrganizerError = Class.new(StandardError)

	validates :first_name, :last_name, presence: true

	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 3..20 }
	validates :username, format: { with: /\A[a-zA-Z_0-9]+\z/ }
	validates :username, format: { without: /\A([0-9]+|_+|[0-9_]+)\z/ }
	validates :username, exclusion: { in: %w(sign_up sign_in sign_out edit password find_by_email) }

	validates :sex, presence: true
	validates :sex, numericality: { only_integer: true, greater_than_or_equal_to: UserSex::UNDEFINED, less_than_or_equal_to: UserSex::FEMALE }, unless: "sex.blank?"

	validates :location, presence: true

	validates :is_univ_student, :is_student_at_minho_univ, :is_inf_eng_student_at_minho_univ, :is_cesium_associate, inclusion: { in: [true, false] }
	validates :profession, presence: true, if: "(is_univ_student != nil) && !is_univ_student"
	validates :university, :course, presence: true, if: "is_univ_student && (is_student_at_minho_univ != nil) && !is_student_at_minho_univ"
	validates :course, presence: true, if: "is_univ_student && is_student_at_minho_univ && (is_inf_eng_student_at_minho_univ != nil) && !is_inf_eng_student_at_minho_univ"
	validates :minho_univ_student_id, presence: true, if: "is_student_at_minho_univ"
	validates :cesium_associate_number, numericality: { only_integer: true }, if: "is_cesium_associate && !cesium_associate_number.blank?"
	validate :student_info_cannot_be_incoherent

	validate :user_must_be_six_years_old

	validates :is_organizer, inclusion: { in: [true, false] }

	def student_info_cannot_be_incoherent
		if is_univ_student
			if is_student_at_minho_univ
				if !is_inf_eng_student_at_minho_univ
					errors[:base] << "User student information is illogical" if is_cesium_associate
				end
			else
				errors[:base] << "User student information is illogical" if is_inf_eng_student_at_minho_univ || is_cesium_associate
			end
		else
			errors[:base] << "User student information is illogical" if is_student_at_minho_univ || is_inf_eng_student_at_minho_univ || is_cesium_associate
		end
	end

	def user_must_be_six_years_old
		if birthday.present? && birthday > (DateTime.now - 6.years)
			errors.add(:birthday, "Users must be, at least, 6 years old")
		end
	end

	# def badges
	# 	BadgeAcquisition.where(user_id: id).map { |bc| bc.badge }
	# end

	def full_name
		"#{first_name} #{last_name}"
	end

	def public_profile
		self
	end

	def registered_at?(activity)
		activities.include? activity
	end

	def sex_to_s
		case sex
		when UserSex::MALE
			'Masculino'
		when UserSex::FEMALE
			'Feminino'
		else
			'Desconhecido'
		end
	end

	def has_social_info
		!facebook_account.blank? || !twitter_account.blank? ||
		!github_account.blank? || !google_plus_account? ||
		!linked_in_account.blank?
	end

	def update_account_badges
		user_badges = badges
		Badge.where(badge_type: BadgeType::USER_ACCOUNT).each do |badge|
			BadgeHandler.send(badge.codename.to_sym, self, badge) if BadgeHandler.respond_to?(badge.codename.to_sym) && !(user_badges.include?(badge))
		end
	end

  def self.participants_with_badges
    User.with_badges(false)
  end

  def self.organizers_with_badges
    User.with_badges(true)
  end

  private

  def self.with_badges(is_organizer)
    User.where(is_organizer: is_organizer)
        .order(badge_acquisitions_count: :desc)
  end
end
