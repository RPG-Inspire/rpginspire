class TopicsController < ApplicationController

  before_action :authenticate_user!, only: [:edit_tag]

  def index
    @tags = Tag.all.order(title: :asc).group_by { |i| i.tag_type }
    @topics = Topic.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @topic = Topic.eager_load(:user).find_by_slug!(params[:id])
  end

  def new
    @topic = TopicForm.new({}, current_user)
  end

  def edit_tag
    @tags = Tag.all.group_by { |i| i.print_type }
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = TopicForm.new(topic_params, current_user, Topic.find(params[:id]))

    if @topic.valid? && @topic.topic.save
      redirect_to :root, notice: 'Your topic has been published successfully!'
    else
      render :new
    end
  end

  def create
    @topic = TopicForm.new(topic_params, current_user)

    if @topic.valid? && @topic.topic.save
      session[:topic_draft_id] = @topic.id unless user_signed_in?
      redirect_to edit_tag_topic_path(@topic.id)
    else
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:link, :title, :own_creative_rights, :body, tag_ids: [])
  end
end

