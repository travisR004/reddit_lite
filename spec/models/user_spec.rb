# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"

  context "User validations" do

    it "should have a password longer than 5" do
      FactoryGirl.build(:user, password: "test").should_not be_valid
    end

    it "should allow creation of a user with password length > 5" do
      FactoryGirl.build(:user).should be_valid
    end

    it "shouldn't store plaintext password" do
      # created_users = FactoryGirl.create_list(:user, 10)
      # created_users.each { |user| user.save }
      user = FactoryGirl.build(:user)
      user.save
      u = User.find(user.id)
      u.password.should be_nil
    end

  end

  describe "associations" do
    it { should have_many(:subs) }
    it { should have_many(:links) }
    it { should have_many(:comments) }
  end

end
