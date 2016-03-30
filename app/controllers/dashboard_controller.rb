class DashboardController < ApplicationController

  def index
    @happiness_average = MoodAverage.happiness_since(7.days.ago)
  end

end