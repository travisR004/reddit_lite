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

class UserVote < ActiveRecord::Base

  belongs_to :voter, :class_name => "User"
  belongs_to :link

end
