class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render :new
    end
  end

  def show
    binding.pry
    @favorites = @user.favorites
    response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=0a104545f05a41bd9c7a93574c768e78&bioguide_id=#{params[:favorites]}")
    @results = response['results']
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
