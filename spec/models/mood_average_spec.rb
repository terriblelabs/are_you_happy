require 'spec_helper'

describe MoodAverage do

  context ".happiness_since" do
    let!(:today_unhappy)          { FactoryGirl.create(:mood, happy: false, created_at: 1.hour.ago) }
    let!(:yesterday_happy)        { FactoryGirl.create(:mood, happy: true,  created_at: 1.day.ago) }
    let!(:two_days_ago_happy)     { FactoryGirl.create(:mood, happy: true,  created_at: 2.days.ago) }
    let!(:three_days_ago_unhappy) { FactoryGirl.create(:mood, happy: false, created_at: 3.days.ago) }

    context "now" do
      it "should average the moods from today" do
        MoodAverage.happiness_since(Time.zone.now).should == 0
      end
    end

    context "today" do
      it "should average the moods from today" do
        MoodAverage.happiness_since(Time.zone.now.beginning_of_day).should == 0.0
      end
    end

    context "2 days ago" do
      it "should include moods from yesterday" do
        MoodAverage.happiness_since(2.days.ago.beginning_of_day).should be_within(0.01).of(0.66)
      end
    end

    context "4 days ago" do
      it "should include moods for the last 4 days" do
        MoodAverage.happiness_since(4.days.ago.beginning_of_day).should == 0.5
      end
    end
  end

end
