class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_login, except: %i[new create]
  
  # GET /users
  # GET /users.json
  def index
    @user_view = params[:view]
    @user_view = 'all' if @user_view.nil?
    @direction = 'users'

    @users = User.all.includes(:photo_blob).order(username: :asc)

    setup_current_user
    setup_matrices
    sort_users
    setup_followings
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
    # params.fetch(:user, {})
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end

  def setup_current_user
    @current_user = User.includes(:photo_blob).find(session[:user_id])

    @current_user_followers = []
    @current_user.followers.each { |u| @current_user_followers << u.id }
    @current_user_followees = []
    @current_user.followed.each { |u| @current_user_followees << u.id }
  end

  def setup_matrices
    @followers_matrix = User.popular_matrix
    @followees_matrix = User.friendly_matrix
    @opinions_matrix = User.opinions_matrix
  end

  def sort_users
    sort_popular if @user_view == 'popular'

    sort_friendly if @user_view == 'friendly'

    sort_protagonists if @user_view == 'protagonists'
  end

  def sort_popular
    matrix = @followers_matrix
    @users = @users.sort do |a, b|
      b.user_followers_count(matrix) <=> a.user_followers_count(matrix)
    end
  end

  def sort_friendly
    matrix = @followees_matrix
    @users = @users.sort do |a, b|
      b.user_followees_count(matrix) <=> a.user_followees_count(matrix)
    end
  end

  def sort_protagonists
    matrix = @opinions_matrix
    @users = @users.sort do |a, b|
      b.user_opinions_count(matrix) <=> a.user_opinions_count(matrix)
    end
  end

  def setup_followings
    setup_users_followings if @direction == 'users'

    setup_user_followings if @direction == 'user'
  end

  def setup_users_followings
    @to_follow = User.includes(:photo_blob).where('id NOT IN (?)', User.user_followed(@current_user))
    @followers = @current_user.followers.includes(:photo_blob)
  end

  def setup_user_followings
    @followings = @user.followed.includes(:photo_blob) if @user_view == 'following'
    @followers = @user.followers.includes(:photo_blob)
  end

end
