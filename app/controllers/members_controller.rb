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
    response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=0a104545f05a41bd9c7a93574c768e78&bioguide_id=#{params[:id]}")
    @results = response['results']
    @twitter_id = @results[0]['twitter_id']
    @tweets = get_tweets(@twitter_id)
  end

  def create
    @member = Member.create(params[:id])
    redirect_to @member
  end


  private

  def find_member
    @member = Member.find(params[:bioguide_id])
  end



end

