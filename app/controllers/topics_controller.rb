class TopicsController < ApplicationController

  def show
    @topic = Topic.eager_load(:user).find_by_slug!(params[:id])
  end
  def new
    @topic = Topic.new
  end

end
