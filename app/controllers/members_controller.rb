class MembersController < ApplicationController
  before_action :find_member, only: [:show]

  def index
    response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=0a104545f05a41bd9c7a93574c768e78&per_page=all")
    @results = response['results']
    @members = Member.all
  end

  def show
    @tweets = get_tweets('adampbarrett')
    render :show
  end

  def profile
    response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=0a104545f05a41bd9c7a93574c768e78&per_page=all")
    @results = response['results']
  end


  private

  def find_member
    @member = Member.find(params[:bioguide_id])
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :twitter_id)
  end

end

