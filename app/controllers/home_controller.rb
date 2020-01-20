class HomeController < ApplicationController

  def index
    @tags = Tag.joins(:topics).order(title: :asc).uniq.group_by { |i| i.tag_type }
    @topics = Actions::Topic.retrieve_topics
  end

end

