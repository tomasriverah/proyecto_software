require 'rails_helper'

RSpec.describe "Servicios", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/servicio/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/servicio/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/servicio/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/servicio/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
