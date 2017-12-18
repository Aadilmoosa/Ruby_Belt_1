class AddsController < ApplicationController
  def new
  end

  def create
    Add.create add_params
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    @add = Add.find(params[:id])
    if @add.user === current_user
      @add.destroy
    end
    redirect_to user_path
  end

  private
    def add_params
      params.require(:add).permit(:song_id).merge(user: current_user)
    end
end
