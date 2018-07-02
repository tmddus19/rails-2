class UsersController < ApplicationController
  def signup
  end
  
  def register
    @msg = ""
    # 만약에 params[:password] == params[:repassword]
    # 회원가입 시킨다. @msg = "회원가입이 완료되었습니다."
    # 아닌 경우
    # @msg = "비밀번호가 일치하지 않습니다."
    if params[:password] == params[:repassword]
      if User.find_by(username: params[:username])
        @msg = "중복된 아이디가 있습니다."
      else
        User.create(
          username: params[:username],
          password: params[:password]
        )
        @msg = "회원가입이 완료되었습니다."
      end
    else  
      @msg = "비밀번호가 일치하지 않습니다."
    end
      
  end

  def login
  end
  
  def logining
    @msg = ""
    # 만약에 DB에 해당하는 아이디의 사람이 있으면 && 비번까지 같으면
    # 로그인 시킨다. == session[:id]
    # @msg = "로그인 되었습니다.""
    user = User.find_by(username: params[:username])
    if user and user.password == params[:password]
      session[:id] = user.id
      @msg = "로그인 되었습니다."
    else
      @msg = "꺼져"
    end
  end

  def logout
    # 유저를 로그아웃 시킨다 == session에서 지워준다.
    session.clear
    redirect_to '/'
  end

  def getout
    #DB에서 지우고
    #session 에서도 날려준다.
    user = User.find(session[:id])
    user.destroy
    session.clear
    redirect_to '/'
  end
  
  def edit
    @user = User.find(session[:id])
  end
  
  def update
    @user = User.find(session[:id])
    @user.update(
      username: params[:username],
      password: params[:password]
    )
    redirect_to '/'
  end
  
  def mypage
    #현재 접속한 유저가 쓴 모든 글을 보여준다.
    @posts = User.find(session[:id]).posts
    @replies = User.find(session[:id]).replies
  end
end