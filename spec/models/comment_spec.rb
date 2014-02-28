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

require 'spec_helper'

describe Comment do

  context "Comment validations" do

    it "Should validate author id presence" do
      FactoryGirl.build(:comment, author_id: nil).should_not be_valid
    end

    it "Should validate parent comment id presence isnt necessary" do
      FactoryGirl.build(:comment, parent_comment_id: nil).should be_valid
    end

    it "Should validate link id presence" do
      FactoryGirl.build(:comment, link_id: nil).should_not be_valid
    end

    it "Should validate body presence" do
      FactoryGirl.build(:comment, body: nil).should_not be_valid
    end

  end

  context "Associations" do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:link) }
    it { should have_many(:child_comments) }
  end
end
