class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_and_belongs_to_many :activities
	has_and_belongs_to_many :editions

	validates :first_name, :last_name, presence: true

	validates :username, presence: true, uniqueness: { case_sensitive: false }

	validates :sex, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: UserSex::UNDEFINED, less_than_or_equal_to: UserSex::FEMALE }

	validates :is_univ_student, :is_student_at_minho_univ, :is_inf_eng_student_at_minho_univ, :is_cesium_associate, inclusion: { in: [true, false] }
	validates :university, :course, presence: true, if: "is_univ_student"
	validates :minho_univ_student_id, presence: true, if: "is_student_at_minho_univ"
	validates :cesium_associate_number, presence: true, numericality: { only_integer: true }, if: "is_cesium_associate"
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

	def badges
		BadgeAcquisition.where(user_id: id).map { |bc| bc.badge }
	end

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
end
