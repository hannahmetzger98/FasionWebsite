class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :show]
  before_action :admin_user, only: [:destroy, :show, :edit, :index]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @options = {}
    user = User.all
    if user 
      user.each do |u|
        @options[u.name] = u.id
      end
    end
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.image.attach(params[:message][:image])
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in and try again"
        redirect_to login_url
      end
  end
    
  def admin_user
    if !current_user.admin?
      redirect_to(root_url)
      flash[:danger] = "Oops!"
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :user_id)
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
