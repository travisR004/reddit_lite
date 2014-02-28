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

require 'spec_helper'

describe Sub do
  context "sub validations" do

    it "should have a title" do
      mod = FactoryGirl.create(:user)
      FactoryGirl.build(:sub, title: nil, moderator_id: mod.id)
        .should_not be_valid
    end

    it "should have a moderator assigned" do
      FactoryGirl.build(:sub).should_not be_valid
    end
  end

  describe "associations" do
    it { should have_many(:links) }
    it { should belong_to(:moderator).class_name('User') }
  end
end
