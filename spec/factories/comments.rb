# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  author_id         :integer          not null
#  parent_comment_id :integer
#  link_id           :integer          not null
#  body              :string(255)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    author_id 1
    parent_comment_id 1
    link_id 1
    body { Faker::Lorem.words(num = 20)  }
  end
end
