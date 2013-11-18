class Mood < ActiveRecord::Base
  def self.since(date)
    where('created_at > ?', date)
  end
end
