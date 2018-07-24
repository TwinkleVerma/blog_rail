class UsersController < ApplicationController

  before_action :find_user_by_id, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    if user_params.present?
      @user = User.new({:username => user_params[:username], :email => user_params[:email], :password => user_params[:password]})
      if @user.save
        if user_params[:user_image_attributes].present?
          image_params = {picture: user_params[:user_image_attributes][:picture]}
          image = @user.build_image(image_params)
          if image.save
            flash[:success] = "User Profile was successfully created"
            redirect_to login_users_path
          else
            flash[:danger] = "Can't create users account"      
            render 'new'
          end
        else
          image = @user.build_image
          if image.save
            flash[:success] = "User Profile was successfully created"
            redirect_to login_users_path
          else
            flash[:danger] = "Can't create users account"      
            render 'new'
          end
        end
      else
        flash[:danger] = "Can't create users account"      
        render 'new'
      end
    else
      flash[:danger] = "Can't create users account"      
      render 'new'
    end
  end

  def update
    if user_params.present?
      if @user.update({:username => user_params[:username], :email => user_params[:email], :password => user_params[:password]})
        if user_params[:user_image_attributes].present?
          image_params = {picture: user_params[:user_image_attributes][:picture]}
          if @user.image != nil
            if @user.image.update(image_params)
              flash[:success] = "User Profile was successfully updated"
              redirect_to user_path(@user.id)
            else
              flash[:danger] = "User Profile not updated"
              render 'edit'
            end
          else
            image = @user.build_image(image_params)
            if image.save
              flash[:success] = "User Profile was successfully updated"
              redirect_to user_path(@user.id)
            else
              flash[:danger] = "User Profile not updated"
              render 'edit'
            end
          end
        else
          flash[:success] = "User Profile was successfully updated"
          redirect_to user_path(@user.id)
        end
      else
        flash[:danger] = "User Profile not updated"
        render 'edit'
      end
    else
      flash[:danger] = "User Profile not updated"
      render 'edit'
    end
  end
  
  def show
  end

  def index
    @users = User.all
  end

  def destroy
    if @user.destroy
      flash[:danger] = "User Profile was successfully deleted"
    else
      flash[:danger] = "Can;t delete user profile"
    end
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
    redirect_to welcome_index_path
  end

  private

  def find_user_by_id
    @user = User.find(params[:id])
    if @user.blank?
      false
    end
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, user_image_attributes: [:picture])
  end

end