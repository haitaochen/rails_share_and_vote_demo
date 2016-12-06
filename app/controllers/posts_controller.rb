class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    end
  end
  def post_params
    params.require(:post).permit(:title)
  end
end
