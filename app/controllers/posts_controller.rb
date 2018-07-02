class PostsController < ApplicationController
  before_action(:check_login, except: [:index])
  before_action(:set_post, except: [:index, :new, :create, :write_reply])
  # 모든 액션이 불리기 직전에 실행한다. (:메소드)
  # before_action(사용자가 로그인 되어있는지 체크해라)
  
  def index
    @posts = Post.all
  end

  def new
    # render 'posts/new'
  end
  
  def create
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: session[:id]
    )
    redirect_to '/'
  end

  def show 
    # 해당하는 글 하나를 보여준다 (/posts/show/:id)
    set_post
  end
  
  def edit
    set_post
  end
  
  def update
    # /posts/update/1 => 1번 id를 가진 Post 내용을 수정하겠다.
    set_post
    @post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to "/posts/show/#{params[:id]}"
  end
  
  def destroy
    # /posts/destroy/1
      set_post
      @post.destroy
      
      redirect_to '/'
  end
  
  def write_reply
    # Reply DB에 내용을 저장하고,
    # redirect_to 이전 페이지로 가게 하겠다.
    Reply.create(
      content: params[:reply],
      post_id: params[:id],
      user_id: session[:id]
    )
    redirect_to :back
    # redirect_to "/posts/show/#{params[:id]}"
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
  def check_login
    # 사용자가 로그인을 안했으면 -> /users/login으로 보내기
    if session[:id].nil?
      redirect_to '/users/login'
    end
  end
end
