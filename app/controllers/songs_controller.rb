class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)

    redirect_to songs_path
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to @song

  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end


end
