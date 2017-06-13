class PostsController < ApplicationController
  before_action :logged_in?

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
      else
        flash[:error] = "Unsuccessfully updated"
         redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if (post.update(post_params))
      redirect_to post_path(post)
    else
      redirect_to edit_post_path(post)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:message] = "Successfully deleted"
    redirect_to user_posts_path(current_user)
  end

  private

 def post_params
  params.require(:post).permit(:image, :caption, :user_id)
 end

end
