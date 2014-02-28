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

require 'spec_helper'

describe Link do
  context "Link validations" do
    it "Should require a link to have a title" do
      FactoryGirl.build(:link, title: nil).should_not be_valid
    end

    it "Should require a link to have a url" do
      FactoryGirl.build(:link, url: nil).should_not be_valid
    end

    it "Should require a link to have a submitter AND sub id" do
      FactoryGirl.build(:link).should_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:submitter).class_name('User') }
    it { should have_many(:subs) }
    it { should have_many(:comments) }
  end
end
