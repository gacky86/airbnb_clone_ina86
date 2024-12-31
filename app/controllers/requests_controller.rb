class RequestsController < ApplicationController
  before_action :set_house, only: :create

  def index
    @requests = current_user.requests
  end

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

  def update
    # raise
    @request = Request.find(params[:id])
    if @request.update(request_params)
      # raise
      redirect_to hosting_path
    else
      # raise
      render hosting_path
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path, status: :see_other, notice: "request was successfully deleted."
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date, :id, :status)
  end

  def set_house
    @house = House.find(params[:house_id])
  end
end
