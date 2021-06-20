class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @posts = Post.all.order(id: :desc).group_by(&:day)
    @rommel = "This is from controller"
    # @posts = Post.order(id: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post), notice: "Post was updated successfully!"
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post has been successfully deleted!"
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
