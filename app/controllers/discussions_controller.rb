class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find_by(shortlink: params[:shortlink])
  end
end
