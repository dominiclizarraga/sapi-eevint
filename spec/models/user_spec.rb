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
require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { FactoryBot.build(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:password]).to include("can't be blank")
    end

    it 'is not valid with a duplicate email' do
      user.save
      another_user = FactoryBot.build(:user, email: user.email)
      expect(another_user).not_to be_valid
      expect(another_user.errors.messages[:email]).to include("has already been taken")
    end
  end
end
