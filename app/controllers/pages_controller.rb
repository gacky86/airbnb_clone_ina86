class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @houses = House.all
    if params[:search].present?
      # search by country or region
      @houses = @houses.where("country ILIKE ?", params[:search][:country]) if params[:search][:country].present?

      # search by iterinery date
      start_date_query = params[:search][:start_date]
      end_date_query = params[:search][:end_date]
      if start_date_query || end_date_query
        start_date_query_parse, end_date_query_parse = retrieve_date_query(start_date_query, end_date_query)
        # コアの動作：houseの除外
        # 除外条件：paramsの日程と重なるreqを持っていること
        @houses.each do |house_each|
          requests = house_each.requests
          next if requests.empty?

          requests.each do |request|
            next if request.status == "REJECTED"

            if request.start_date <= end_date_query_parse && start_date_query_parse <= request.end_date
              @houses = @houses.reject { |house| house == house_each }
              break
            end
          end
        end
      end

      # bookmark
      @bookmarks = Bookmark.where("user=?", current_user)
    end
  end

  private

  def retrieve_date_query(start_date_query, end_date_query)
    if start_date_query != "" && end_date_query != ""
      parse
      start_date_query_parse = retrieve_start_date_query(start_date_query)
      end_date_query_parse = retrieve_end_date_query(end_date_query)

    elsif start_date_query != "" && end_date_query == ""
      start_date_query_parse = retrieve_start_date_query(start_date_query)
      end_date_query_parse = start_date_query_parse

    elsif start_date_query == "" && end_date_query != ""
      end_date_query_parse = retrieve_end_date_query(end_date_query)
      start_date_query_parse = end_date_query_parse
    end
    return start_date_query_parse, end_date_query_parse
  end

  def retrieve_start_date_query(start_date_query)
    Date.parse(start_date_query)
  end

  def retrieve_end_date_query(end_date_query)
    Date.parse(end_date_query)
  end

end
