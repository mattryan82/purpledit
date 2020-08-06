class VotesController < ApplicationController
  before_action :set_post
  

  # POST /votes
  # POST /votes.json
  def create
    #@vote = Vote.new(vote_params.merge(user: current_user))
    @post.votes.create(vote_params.merge(user: current_user))
   

    respond_to do |format|
      if @post.votes.create
        format.html { redirect_to @post, notice: 'Vote was successfully created.'}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, notice: 'Vote was unsuccessfully created.'}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @post.votes.destroy_all(vote_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:vote_type)
    end

    def authorize_vote
      if @vote
        authorize @vote
      else
        authorize Vote
      end
    end
end
