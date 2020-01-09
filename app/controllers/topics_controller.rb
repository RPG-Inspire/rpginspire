class TopicsController < ApplicationController

  before_action :authenticate_user!, only: [:edit_tag]

  def index
    @topics = Actions::Topic.retrieve_topics(tag_title_list, params[:page])
    respond_to do |format|
      format.html do
        @tags = Tag.joins(:topics).order(title: :asc).uniq.group_by { |i| i.tag_type }
      end
      format.json
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :update, @topic
    @tags = Contexts::Tag.get_all_grouped
  end

  def show
    @topic = Topic.eager_load(:user).find_by_slug!(params[:id])
  end

  def new
    @page_title = 'New topic'
    @topic = TopicForm.new({}, current_user)
  end

  def edit_tag
    @topic = Topic.find(params[:id])
    authorize! :edit_tag, @topic
    @tags = Contexts::Tag.get_all_grouped
  end

  def update
    @topic = TopicForm.new(topic_params, current_user, Topic.find(params[:id]))
    authorize! :update, @topic.topic

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

  def tag_title_list
    params[:tags]&.split('--') || []
  end

  def topic_params
    return {} if params[:topic].nil?
    params.require(:topic).permit(:link, :title, :own_creative_rights, :body, :image, tag_ids: [])
  end
end

