class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    flash.notice = params

    @direction = 'root'
    @current_user = User.find(session[:user_id])
    @opinion = Opinion.new
    @opinions = Opinion.all.ordered_by_most_recent

    @current_user = User.find(session[:user_id])
    @to_follow = User.to_follow(@current_user)

  end

  def new
    @opinion = Opinion.new
    
  end

  def edit
    
  end

  def create
    flash[:notice] = params
    
    @opinion = Opinion.new(opinion_params)
    @opinion.author_id = session[:user_id]
    
    flash[:alert] = @opinion.errors.full_messages unless @opinion.save

    redirect_to opinions_path
  end

  def update
    if @opinion.update(opinion_params)
      redirect_to opinions_path
    else
      redirect_to edit_opinion_path(params[:id])
    end
  end

  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    def opinion_params
      params.require(:opinion).permit(:text)
    end


end
