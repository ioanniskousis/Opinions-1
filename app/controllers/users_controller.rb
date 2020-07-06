class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_login, except: %i[new create]

  def index
    flash.notice = params

    @user_view = params[:view]
    @user_view = 'all' if @user_view.nil?

    @current_user = User.find(session[:user_id])

    @users = User.all.sort_by_popular if @user_view == 'popular'
    @users = User.all.sort_by_friendly if @user_view == 'friendly'
    @users = User.all.protagonists if @user_view == 'protagonists'
    @users = User.all.order('username') if @user_view == 'all'

    @to_follow = User.to_follow(@current_user)

    @direction = 'users'
  end

  def show
    @user_view = params[:view]
    @user_view = 'details' if @user_view.nil?

    # flash.notice = params

    @current_user = User.find(session[:user_id])
    @user = User.find(params[:id])

    if @user_view == 'opinions'
      @opinion = @user.opinions.new
      @opinions = @user.opinions.ordered_by_most_recent
    end

    @followings = @user.followed if @user_view == 'following'
    @followers = @user.followers if @user_view == 'followers'

    # @to_follow = User.to_follow(@user)
    @direction = 'user'
  end

  # GET /users/new
  def new
    @caption = 'New User Signup'

    # @direction = 'new_user'
    @user = User.new
    # redirect_to root_path(direction: 'new_user')
  end

  # GET /users/1/edit
  def edit
    @current_user = User.find(session[:user_id])
    @user = @current_user
    @caption = 'Edit User Details'
    # redirect_to root_path(direction: 'edit_user', user: params[:id])
    @direction = 'user'
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
      redirect_to user_path(@user), notice: 'User was successfully updated.'
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
