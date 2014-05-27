class CongressController < ApplicationController

  def index
    response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=0a104545f05a41bd9c7a93574c768e78&per_page=all")
    @results = response['results']
  end

end
