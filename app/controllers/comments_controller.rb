class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit, :create, :update]
  before_action :set_movie, only: [:new, :edit, :create, :update]
  # before_action :require_admin_user!

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.movie = @movie

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @movie, notice: 'Comment was successfully created.' }
        # format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @movie, notice: 'Comment was successfully updated.' }
        # format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @movie, notice: 'Comment was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      @user = @comment.user
      @movie = @comment.movie
    end

    def set_user
      @user = current_user
      unless @user
        redirect_to root_path, alert: "Invalid action"
      end
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
      unless @movie
        redirect_to root_path, alert: "Invalid action"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
