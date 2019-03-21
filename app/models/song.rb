class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true, unless: :check_artist_and_year

  with_options if: :released? do
    # validates :release_year, presence: true
    validates :release_year, numericality: true
    validate :check_release_year
  end

  validates :artist_name, presence: true




  def check_artist_and_year
    Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
  end

  def check_release_year
    if release_year
      release_year <= Time.now.year
    end
  end


end
