class Song < ApplicationRecord
  validates :title, presence:true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence:true
  validates :released, inclusion: {in: [true, false]}
  validate :release_year_validation
  # with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end


  def release_year_validation
    if self.released
      if self.release_year.nil? || self.release_year >= Date.current.year
        errors.add(:release_year, "cannot be false or blank or be release in year after #{Date.current.year}")
      end
    end
  end

  # def released?
  #   released
  # end


end


# end
