require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  describe "GET #upvote" do
    it "returns http success" do
      get :upvote
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #remove_upvote" do
    it "returns http success" do
      get :remove_upvote
      expect(response).to have_http_status(:success)
    end
  end

end
