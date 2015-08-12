class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to "/"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to "/"
  end

  def community
    @posts = Post.where("LOWER(tag) LIKE ?", "%community%").uniq.order(created_at: :desc)
  end

  def universe
    @posts = Post.where("LOWER(tag) LIKE ?", "%universe%").uniq.order(created_at: :desc)
  end

  def you
    @posts = Post.where("LOWER(tag) LIKE ?", "%you%").uniq.order(created_at: :desc)
  end

  def post_params
    params.require(:post).permit(:title, :body, :image_url, :tag)
  end

end
