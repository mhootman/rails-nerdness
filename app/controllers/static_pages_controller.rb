class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def team_api
    if !session[:user_id]
      redirect_to root_url
    end
  end
end
