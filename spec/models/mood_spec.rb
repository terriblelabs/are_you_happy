require 'spec_helper'

describe Mood do

  context ".new" do
    it "should be valid" do
      FactoryGirl.create(:mood).should be_valid
    end
  end

  context ".since" do
    let!(:yesterday) { FactoryGirl.create(:mood, created_at: 1.day.ago) }
    let!(:three_days_ago) { FactoryGirl.create(:mood, created_at: 3.days.ago) }

    context "today" do
      it "should only include moods from today" do
        Mood.since(Time.zone.now.beginning_of_day).should == []
      end
    end

    context "2 days ago" do
      it "should include moods from yesterday" do
        Mood.since(2.days.ago).should == [yesterday]
      end
    end

    context "4 days ago" do
      it "should include moods for the last 4 days" do
        Mood.since(4.days.ago).should == [yesterday, three_days_ago]
      end
    end
  end

end
