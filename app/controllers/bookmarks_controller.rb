class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    # Logic to create a new bookmark
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    if @bookmark.save
      # Handle successful bookmark creation
      redirect_to list_path(@list)
    else
      # Handle failed bookmark creation
      render :new, status: :unprocessable_entity
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
    params.require(:bookmark).permit(:comment, :movie, :list_id)
  end
end
