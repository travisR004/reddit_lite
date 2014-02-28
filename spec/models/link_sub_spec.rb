# == Schema Information
#
# Table name: link_subs
#
#  id      :integer          not null, primary key
#  sub_id  :integer
#  link_id :integer
#

require 'spec_helper'

describe LinkSub do

  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:sub) }

  it {should belong_to(:link) }
  it {should belong_to(:sub) }
end
