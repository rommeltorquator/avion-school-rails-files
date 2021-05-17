class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc).group_by(&:day)
    # @posts = Post.order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    
    redirect_to posts_path if @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
