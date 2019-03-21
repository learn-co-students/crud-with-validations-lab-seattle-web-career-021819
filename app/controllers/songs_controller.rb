class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  #CREATE
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(post_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

    #READ
    def index
      @songs = Song.all
    end

    def show
    end

    #UPDATE
    def edit
    end

    def update
      if @song.update(post_params)
        redirect_to song_path(@song)
      else
        render :edit
      end
    end

    #DESTROY
    def destroy
      @song.destroy
      redirect_to songs_path
    end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def post_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end



#Questions: Why do we instaniate a new song twice --- seems redundant
