class BookmarksController < ApplicationController
  def create
    house = House.find(params[:house_id])
    current_user.bookmark(house)
    redirect_to home_path, notice: "Bookmarked successfully!"
  end

  def destroy
    # @house = current_user.bookmarks.find(params[:house_id]).house
    house = House.find(params[:id])
    current_user.unbookmark(house)
    redirect_to home_path, notice: "Bookmark removed successfully!"
  end

end
