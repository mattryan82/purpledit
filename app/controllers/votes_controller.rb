class VotesController < ApplicationController
  before_action :set_post
  before_action :authorize_post

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])
    @comment = Comment.new(post: @post)
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @post.votes.where(user_id: current_user.id).first_or_create
    @vote.user = current_user

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @post, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @post.votes.where(user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:post, :user).permit(:vote_type)
    end

    def authorize_vote
      if @vote
        authorize @vote
      else
        authorize Vote
      end
    end
end
