require "spec_helper"

feature "Viewing Dashboard" do
  let!(:today_unhappy)          { FactoryGirl.create(:mood, happy: false, created_at: 1.hour.ago) }
  let!(:yesterday_happy)        { FactoryGirl.create(:mood, happy: true,  created_at: 1.day.ago) }
  let!(:two_days_ago_happy)     { FactoryGirl.create(:mood, happy: true,  created_at: 2.days.ago) }
  let!(:three_days_ago_unhappy) { FactoryGirl.create(:mood, happy: false, created_at: 3.days.ago) }

  scenario "I view the dashboard" do
    visit "/dashboard"

    page.should have_content "50%"
  end
end
