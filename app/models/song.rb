class Song < ApplicationRecord
  validates :title, presence:true
  validates :artist_name, presence:true
  validates :released, inclusion: { in: [true, false] }
  validate :release_time
  validate :year_valid
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }

  def release_time
      if self.released && self.release_year
          if (self.release_year>Time.now.year)
              errors.add(:release_year, message: "That's not the right year!")
          end
      end
      true
  end

  def year_valid
      if self.released && !self.release_year
              errors.add(:release_year, message: "Add a release year!")
      end
      true
  end
end
