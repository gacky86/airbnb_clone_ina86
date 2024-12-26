class RequestsController < ApplicationController
  before_action :set_house, only: :create

  def create
    @request = Request.new(request_params)
    @request.house = @house
    @request.status = "PENDING"
    @request.user = current_user
    # raise
    if @request.save
      redirect_to house_path(@house)
    else
      # raise @request.errors.full_messages.join(", ")
      redirect_to home_path, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end

  def set_house
    @house = House.find(params[:house_id])
  end
end
