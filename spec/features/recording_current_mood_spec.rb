require "spec_helper"

feature "Recording current mood" do
  scenario "I record that I am happy" do
    visit "/"
    click_on "Yes"

    expect_mood_to_be_recorded_as_happy
  end

  scenario "I record that I am unhappy" do
    visit "/"
    click_on "No"

    expect_mood_to_be_recorded_as_unhappy
  end

  private

  def expect_mood_to_be_recorded_as_happy
    mood = Mood.last

    expect(mood).to be_happy
  end

  def expect_mood_to_be_recorded_as_unhappy
    mood = Mood.last

    expect(mood).to_not be_happy
  end
end
