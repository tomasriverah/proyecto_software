require 'rails_helper'

RSpec.describe "Carretes", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/carretes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/carretes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/carretes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/carretes/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
