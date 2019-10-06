class HomeController < ApplicationController

  def index
    @tags = Tag.all.order(title: :asc).group_by { |i| i.tag_type }
    @topics = Topic.order(id: :desc).page(params[:page]).per(20)
  end

end

