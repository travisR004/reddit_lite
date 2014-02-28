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

require 'spec_helper'

describe UserVote do
  pending "add some examples to (or delete) #{__FILE__}"
end
