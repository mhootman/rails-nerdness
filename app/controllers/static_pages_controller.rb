class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to current_user
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def team_api
  end
end
