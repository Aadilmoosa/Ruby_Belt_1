class SongsController < ApplicationController

  
  def index
    # @songs = Song.all
    # @songs = Song.find(params[:id])
    # @users = Song.find(params[:id]).users

    # @song = Song.joins(:user).select('count(users.id), songs.*').where(id: params[:id]).group(:id).first

    @song = Song.find(params[:id])
    p 'song', @song

    @users = User
      .joins(:songs_added)
      .select('users.*, count(songs.id) as song_count')
      .where("adds.song_id = #{@song.id}")
      .group(:id)

    # @users = User.find_by_sql ["select * from users where id = ?", 1]
    # @songs = User.find(params[:id]).songs_added.group("songs.id")
    
    # , title: '#{song.title}'

    # .where(title: '#{song.title}')

    # where(:title, "#{song.title}").

    # redirect_to songs_path
  end

  def create
    song = Song.new song_params
    unless song.save
      flash[:errors] = song.errors.full_messages
    end
    redirect_to "/users/#{current_user.id}"
  end

  # def destroy
  #   @songs = Song.find(params[:id])
  #   if @song.user === current_user
  #     @song.destroy
  #   end
  #   redirect_to user_path
  # end


  def personal
    @user = User.find(params[:id])
    @song = Song.find(params[:id])
    @add = Add.find(params[:id])

  end


  private
    def song_params
      params.require(:song).permit(:title, :artist).merge(user: current_user)
    end

end
