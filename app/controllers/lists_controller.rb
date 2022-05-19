class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where('list_id' == @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(index_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  private

  def index_params
    params.require(:list).permit(:name)
  end
end
