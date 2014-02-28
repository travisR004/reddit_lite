# == Schema Information
#
# Table name: user_votes
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  voter_id   :integer
#  vote       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_vote do
    link_id 1
    voter_id 1
    vote "MyString"
  end
end
