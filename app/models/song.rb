class Song < ApplicationRecord

  validates :title, presence:true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence:true
  validate :released?
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }

  def released?
    if self.released
      if !self.release_year || self.release_year > Time.new.year
        errors.add(:release_year, "must be filled")
      end
    end
  end

end
