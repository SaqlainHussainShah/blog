class PostsController < ApplicationController
  def index
  	@posts=Post.all
  end
  def edit
    @post=Post.find(params[:id])
  end
  def update
    @post=Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, :notice=>"Updated post"
    else
      render "edit"
    end
  end
  def show
    @post=Post.find(params[:id] )
  end
  def new
    @post=Post.new
  end
  def create
    @post=Post.create(post_params)
   if  @post.save
    redirect_to posts_path, :notice=>"your post was saved"
  else
    render "new"
  end
  end
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice=>"Deleted"
  end
  # For creating this was done
  private
def post_params
  params.require(:post).permit!
end
end
