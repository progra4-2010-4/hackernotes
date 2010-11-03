class StaticController < ApplicationController
  def index
    @title = "Home"
  end

  def about
    @title = "About"
  end

end
