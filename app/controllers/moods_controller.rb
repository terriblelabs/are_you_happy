class MoodsController < ApplicationController
  def new
    @mood = Mood.new
  end

  def create
    Mood.create!(mood_params)
    head :ok
  end

  private

  def mood_params
    params.require(:mood).permit(:happy)
  end
end
