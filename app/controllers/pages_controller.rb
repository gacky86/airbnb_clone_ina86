class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @houses = House.all
    @requests = Request.where("status = ? OR status = ?", "PENDING", "ACCEPTED")
    # puts params
    # houseからrequestにアクセスして、pending/accepted のstatusを持つリクエストを持つhouse以外を抽出する
    if params[:search][:start_date].present?

      start_date_query = Date.parse(params[:search][:start_date])
      end_date_query = Date.parse(params[:search][:end_date])

      @houses.each do |house_a|
        requests = house_a.requests
        next if requests.empty?

        requests.each do |request|
          unless end_date_query < request.start_date || request.end_date < start_date_query
            @houses = @houses.reject { |house| house == house_a }
            break
          end
        end
      end

      @houses = @houses.where("country ILIKE ?", params[:search][:country])
    end
  end

end
