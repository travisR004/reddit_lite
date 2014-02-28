# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  url          :string(255)      not null
#  description  :string(255)
#  submitter_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Link < ActiveRecord::Base
  validates :title, :url, :submitter_id, presence: true
  # validates :subs, presence: true

  belongs_to :submitter, :class_name => "User"

  has_many :subs, through: :link_subs
  has_many :link_subs, :inverse_of => :link
  has_many :comments
  has_many :user_votes
  has_many :voters, :through => :user_votes, :source => :voter

  def count_upvotes
    user_votes.where(:vote => "up").count - user_votes.where(:vote => "down").count
  end

end
