class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, 
    presence: true, 
    numericality: { less_than_or_equal_to: Date.today.year },
    if: :released?

  def self.genres 
    Song.all.map {|song| song.genre }.uniq
  end

end