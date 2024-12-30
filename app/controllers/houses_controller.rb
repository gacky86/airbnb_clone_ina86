class HousesController < ApplicationController
  # skip user login (devise)
  skip_before_action :authenticate_user!, only: :show

  def index
    # current_userが持つhouseだけ一覧表示する?
    @houses = current_user.houses
  end

  def show
    @house = House.find(params[:id])
    @request = Request.new
    @requests = @house.requests
  end

  def new
    @house = House.new
  end

  def create
    @house = current_user.house.build(house_params)
    if @house.save
      redirect_to home_path
    else
      puts @house.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    @house = current_user.house.build(house_params)
    if @house.save
      redirect_to home_path
    else
      puts @house.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def house_params
    params.require(:house).permit(:title, :country, :city, :description, photos: [])
  end

end
