require 'rails_helper'

RSpec.describe "Settings", type: :request do

  describe "GET /display" do
    it "returns http success" do
      get "/settings/display"
      expect(response).to have_http_status(:success)
    end
  end

end
