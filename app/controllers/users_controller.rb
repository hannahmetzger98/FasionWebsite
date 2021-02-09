class UsersController < ApplicationController
  
   #only logged in users can access the edit and update actions/views.  
    before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :show]
    
   #only the correct user can access the edit and update actions/views.
    before_action :correct_user, only: [:edit, :update, :show]
 
    #only the admin user has the power to use destroy
    before_action  :admin_user,  only: [:destroy, :index]
  
  def index
    @users = User.all
  end  
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to our wonderful app"
      redirect_to @user
    else
      render 'new'
    end 
  end 
  
   def edit
    @user = User.find(params[:id])
   end
  
  def update
    @user = User.find(params[:id])
       if @user.update (user_params)
         flash[:success] = "Profile updated successfully"
         redirect_to @user
       else
         render 'edit'
       end
  end 
  
    def destroy
     User.find(params[:id]).destroy
     flash[:success] = "The user is successfully deleted"
     redirect_to users_url
    end 
  
  private 
  
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def logged_in_user
        #unless is the opposite of if – if the user is not logged in
      unless logged_in?
          #redirect the user to the new action/view to log in
        flash[:danger] = "Please log in"
        redirect_to login_url
          #if the user is logged in, do nothing.
      end
    end
    
    def correct_user
      #find the user who’s id is submitted
      @user = User.find(params[:id])
      #redirect the user to the root url if they are not the correct user 
      #(i.e., if someone is trying to access someone else’s account)
      redirect_to(root_url) && flash[:danger] = "Not the logged in user!" unless current_user?(@user)
      #if the user is the correct user, do nothing.
    end 
    
    
    def admin_user
     redirect_to(root_url) unless current_user.admin?
    end


end
