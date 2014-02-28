# == Schema Information
#
# Table name: link_subs
#
#  id      :integer          not null, primary key
#  sub_id  :integer
#  link_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_sub do
    sub_id 1
    link_id 1
  end
end
