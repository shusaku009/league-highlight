require 'rails_helper'

RSpec.describe "Teams", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/teams/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    xit "returns http success" do
      get "/teams/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    xit "returns http success" do
      get "/teams/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    xit "returns http success" do
      get "/teams/update"
      expect(response).to have_http_status(:success)
    end
  end

end
