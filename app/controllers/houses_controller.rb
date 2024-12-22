class HousesController < ApplicationController
  # skip user login (devise)
  skip_before_action :authenticate_user!, only: :show

  def show
    @house = House.find(params[:id])
  end
end
