class FavoritesController < ApplicationController

  def index
  end

  def create
    if current_user
      current_user.favorites.create(favorite_params)
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  private

    def favorite_params
      params.require(:favorite).permit(:member_id, :user_id)
    end

end

