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

class Comment < ActiveRecord::Base
  validates :author_id, :link_id, :body, presence: true

  has_many :child_comments,
  :class_name => "Comment",
  :foreign_key => :parent_comment_id

  belongs_to :author, :class_name => "User"

  belongs_to :link

  def self.comments_by_parent_id
    comments = Hash.new { |hash,key| hash[key] = [] }

    Comment.all.each do |word|
      p comments
      if word.parent_comment_id.nil?
        comments[:nothing] << word
      else
        comments[word.parent_comment_id] << word
      end
    end
    comments
  end

end
