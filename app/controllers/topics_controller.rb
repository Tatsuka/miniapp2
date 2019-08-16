class TopicsController < ApplicationController


  def index
    @topics = Topic.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    flash[:notice] = "投稿したよ！！"
  end

  def create
    Topic.create(text: topic_params[:text], user_id: current_user.id)
    redirect_to controller: :topics, action: :index
  end

  def show
    @topics = current_user.topics.page(params[:page]).per(5).order("created_at DESC")
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy if topic.user_id == current_user.id
    redirect_to controller: :topics, action: :index
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    topic = Topic.find(params[:id])
    if topic.user_id == current_user.id
      topic.update(topic_params)
    end
    redirect_to controller: :topics, action: :index
  end

  private
  def topic_params
    params.permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

