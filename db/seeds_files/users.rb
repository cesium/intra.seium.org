module Seed
  def self.users
    User.create!([
      {
        email: "test_user@gmail.com",
        first_name: "Test",
        last_name: "User",
        username: "test_user",
        password: "12345678",
        password_confirmation: "12345678",
        location: "Braga",
        sex: UserSex::MALE,
        is_univ_student: true,
        is_student_at_minho_univ: false,
        university: "FEUP",
        course: "IBM",
        is_inf_eng_student_at_minho_univ: false,
        is_cesium_associate: false
      }
    ])
  end
end
