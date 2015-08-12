class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:tag_id])
  end
  
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    @post
    redirect_to "/"
  end

  def edit
    @tag = Tag.find(params[:tag_id])
  end

  def update
    @tag = tag.find(params[:tag_id])
    @tag.update(tag_params)
    redirect_to "/tags/#{params[:tag_id]}"
  end

  def destroy
    @customer = tag.find(params[:tag_id]).destroy
  end

  def tag_params
    params.require(:tag).permit(:tag)
  end

end