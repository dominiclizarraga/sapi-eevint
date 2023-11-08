# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password {"password"}
    password_confirmation { "password" }
    admin { false }
  end

  # First user created via `rails c`
  # User.create!(email: "user@user.com", password: "pasword")

  # factory :admin do
  #   email {"test@admin.com"}
  #   password {"password"}
  #   admin {true}
  # end
end
