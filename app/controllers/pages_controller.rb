class PagesController < ApplicationController

  def home
    @emails = User.all
  end
end
