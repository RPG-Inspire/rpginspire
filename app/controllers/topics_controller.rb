class TopicsController < ApplicationController

  def index
    @tags = Tag.all.order(title: :asc).group_by { |i| i.tag_type }
    @topics = Topic.order(:id).page(params[:page]).per(20)
  end

  def show
    @topic = Topic.eager_load(:user).find_by_slug!(params[:id])
  end

  def new
    @topic = Topic.new
  end

end
