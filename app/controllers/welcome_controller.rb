class WelcomeController < ApplicationController
  def index
    redirect_to discussion_path('a123x4')
  end
end
