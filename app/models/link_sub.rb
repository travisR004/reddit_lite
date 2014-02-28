# == Schema Information
#
# Table name: link_subs
#
#  id      :integer          not null, primary key
#  sub_id  :integer
#  link_id :integer
#

class LinkSub < ActiveRecord::Base
  validates :sub, :link, presence: true

  belongs_to :link, :inverse_of => :link_subs
  belongs_to :sub, :inverse_of => :link_subs
end
