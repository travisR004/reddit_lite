# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true

  belongs_to :moderator, :class_name => "User"

  has_many :links, through: :link_subs
  has_many :link_subs, inverse_of: :sub

  #should test validation for links association
end
