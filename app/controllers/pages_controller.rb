class PagesController < ApplicationController

  def home
    if current_user == nil
      redirect_to '/login'
    end
  end


end
