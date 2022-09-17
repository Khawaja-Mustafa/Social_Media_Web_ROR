class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!, except: [:index, :show]
  before_action :correct_account, only: [:edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    # added this
    @comments = Comment.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = Comment.all
  end

  # GET /posts/new
  def new
    # @post = Post.new
    @post = current_account.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id if account_signed_in?
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    # yeh add kia sath format.js
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  # def like
  #   #grabbing the post
  #   @post = Post.all.find(params[:id])
  #   #creating a like with that post and the current user's id
  #   Like.create(account_id: current_account.id, post_id: @post.id)
  #   #redirecting them bach to that post
  #   redirect_to posts_path(@post)
  # end

  # This will show the name of the user who owns the post
  def show_profile
    @post = Post.find(params[:id])
    @account = @post.account
  end

  #This Method is only for correct user access only 
  def correct_account
    @post = current_account.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "Not Authorized To Edit This post" if @post.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :post_image)
    end
end
