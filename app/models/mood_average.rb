class MoodAverage
  def self.happiness_since(date)
    total_happiness = 0
    moods = Mood.since(date)

    moods.each do |mood|
      total_happiness += 1 if mood.happy?
    end

    return 0 if moods.count == 0
    total_happiness.to_f / moods.count
  end
end