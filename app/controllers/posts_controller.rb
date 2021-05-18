class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @posts = Post.all.order(id: :desc).group_by(&:day)
    @rommel = "This is from controller"
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
      redirect_to @post, notice: "Post was successfully created!"
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
    redirect_to post_path(@post), notice: "Post was updated successfully!"
  end

  def destroy
    @post = Post.find(params[:id])
    
    @post.destroy
    redirect_to root_path, notice: "Post has been successfully deleted!"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
