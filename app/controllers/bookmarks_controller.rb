class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end
  def new
    @bookmark = Bookmark.new
  end

  def create
    # Logic to create a new bookmark
    @bookmark = Bookmark.new(params[:id])

    if @bookmark.save
      # Handle successful bookmark creation
      redirect_to @bookmark
    else
      # Handle failed bookmark creation
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # Handle successful deletion
    redirect_to bookmarks_path
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
