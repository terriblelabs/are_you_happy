class MoodAverage
  def self.happiness_since(date)
    moods = Mood.since(date)
    return 0 if moods.count == 0

    moods.where(happy: true).count.to_f / moods.count
  end
end