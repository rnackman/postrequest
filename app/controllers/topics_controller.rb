class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    # def topic_status
    #   if topic.status == "requested"
    #     "<td><span class='label label-danger'>No one is writing about this yet.</span></td>".html_safe
    #   elsif topic.status == "pending"
    #     if logged_in? && topic.writer.id == current_user.id
    #       "<td><span class='label label-warning'>You are working on this!</span></td>".html_safe
    #     else
    #       "<td><span class='label label-warning'>#{topic.writer.name} is working on this!</span></td>".html_safe
    #     end
    #   elsif topic.status == "completed"
    #     if logged_in? && topic.writer.id == current_user.id
    #       "<td><span class='label label-success'>You wrote this!</span></td>".html_safe
    #     else
    #       "<td><span class='label label-success'>#{topic.writer.name} wrote this!</span></td>".html_safe
    #     end
    #   end
    # end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    respond_to do |format|
      if @topic.save
        @topic.requester_id = current_user.id
        @topic.status = "requested"
        @topic.save
        format.html { redirect_to root_path, notice: 'Thanks for suggesting a topic!' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :notes, :created_at)
    end
end
