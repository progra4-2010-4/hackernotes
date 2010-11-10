class StaticController < ApplicationController
  def index
    @title = "Home"
    flash.keep
    redirect_to new_note_path if user_signed_in?
  end

  def about
    @title = "About"
  end

end
