class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find_by(shortlink: params[:id])
  end
end
