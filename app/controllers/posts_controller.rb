class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end
  
  def show
    #해당하는 글 하나를 보여준다. (/posts/show/11)
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to "/posts/show/#{@post.id}"
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end
  
end
