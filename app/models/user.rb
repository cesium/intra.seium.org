class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_and_belongs_to_many :activities
	has_and_belongs_to_many :editions

	validates :first_name, presence: true
	validates :last_name, presence: true

	validates :username, presence: true
	validates :username, uniqueness: { case_sensitive: false }

	validates :sex, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: UserSex::UNDEFINED, less_than_or_equal_to: UserSex::FEMALE }

	validates :is_student, presence: true
	validates :is_student_at_minho_univ, presence: true
	validates :is_inf_eng_student_at_minho_univ, presence: true
	validates :is_cesium_associate, presence: true

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
