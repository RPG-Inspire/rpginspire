class HomeController < ApplicationController

  def index
    @tags = Tag.joins(:topics).order(title: :asc).uniq.group_by { |i| i.tag_type }
    @topics = Topic.includes(:tags, :votes, :user).order(id: :desc).page(params[:page]).per(20)
  end

end

