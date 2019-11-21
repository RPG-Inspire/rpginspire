class Api::TopicsController < Api::BaseController

  def upvote
    topic = Topic.find_by_id! params[:id]
    vote = Actions::Voting.upvote_topic(topic, current_user)

    if vote.save
      render json: vote.to_json
    else
      return :unprocessable_entity
    end
  end

  def remove_upvote
    topic = Topic.find_by_id! params[:id]
    user = User.find(rand(1..User.count))
    vote = Actions::Voting.reclaim_vote(topic, user)

    if vote.save
      render json: vote.to_json
    else
      return :unprocessable_entity
    end
  end
end

