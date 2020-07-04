class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: %i[new create]

  def index
    @current_user = User.find(session[:user_id])
    @users = User.all
    # redirect_to root_path(direction: 'users')
    @direction = 'users'
  end

  def show
    @current_user = User.find(session[:user_id])
    @direction = 'user'
    # redirect_to root_path(direction: 'user', user: params[:id])
  end

  # GET /users/new
  def new
    
    @direction = 'new_user'
    @user = User.new
    # redirect_to root_path(direction: 'new_user')
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path(direction: 'edit_user', user: params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # flash[:notice] = params

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path(direction: 'root')
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # flash[:notice] = 'update'
    if @user.update(user_params)
      redirect_to root_path(direction: 'user', user: @user), notice: 'User was successfully updated.'
    else
      redirect_to edit_user_path
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :fullname, :photo, :coverimage)
    end
end
