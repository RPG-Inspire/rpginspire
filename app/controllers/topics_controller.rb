class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

end
