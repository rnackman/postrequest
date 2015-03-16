class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(topic_id: params[:topic_id], writer_id: params[:writer_id], status: "pending")
    @post.save
    
    set_topic
    @topic.status = "pending"
    @topic.claimed_at = Date.today
    @topic.save
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Thanks for signing up!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path, notice: 'We weren\'t able to sign you up for that post. Please try again!' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    set_topic
    @post.status = params[:status]
    @post.save
    
    @topic.status = @post.status
    if @topic.status = "completed"
      @topic.completed_at = Date.today
      @topic.link = params[:link]
    end
    @topic.save

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_path(@post.topic), notice: 'Post successfully completed!' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @topic = Topic.find(@post.topic_id)
    @topic.status = "requested"
    @topic.claimed_at = nil
    @topic.save
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'We\'ve removed that post from your list.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(@post.topic.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:topic_id, :writer_id, :status)
    end
end
