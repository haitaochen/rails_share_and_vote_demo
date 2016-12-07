class PostsController < ApplicationController
  def show

    @post = Post.find(params[:id])
    @voter= User.find(2)

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
  def upvote
    @post = Post.find(params[:id])
    @voter= User.find(1)

          @post.liked_by @voter
          @size=@post.get_likes.size
          p @size
          p '---'
          redirect_to post_path(@post.id)

  end
  def downvote
    @post = Post.find(params[:id])
    @voter= User.find(1)

          @post.disliked_by @voter
          @size=@post.get_dislikes.size
          p @size
          p '++++++'
          redirect_to post_path(@post.id)
  end
end
