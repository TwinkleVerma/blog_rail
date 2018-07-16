class UsersController < ApplicationController
  before_action :require_login, except: [:login, :new, :create, :auth_user]
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(article_params)
    if @user.save
      flash[:success] = "User Profile was successfully created"
      redirect_to login_users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(article_params)
      flash[:success] = "User Profile was successfully updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User Profile was successfully deleted"
    redirect_to users_path
  end

  def login
    if current_user!=nil
      redirect_to articles_path  
    else
      render 'login'
    end
  end

  def auth_user
    @user = User.find_by_email(params[:email])
    if(@user!=nil && @user.password==params[:password]) 
      flash[:success] = "User Successfully Login"
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      flash[:danger] = "Invalid Userid or Password"
      redirect_to login_users_path
    end
  end

  def logout
    current_user = session[:user_id] = nil  
    redirect_to root_path 
  end

  private

  def article_params
    params.require(:user).permit(:username, :email, :password)
  end

end