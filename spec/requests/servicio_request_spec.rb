# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Servicios', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/servicio/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/servicio/admin_index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/servicio/new'
      expect(response).to have_http_status(:success)
    end

    it 'renders new template' do
      get '/servicio/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'New Service' do
    it 'creates a new service' do
      post '/servicio', params: { servicio: { title: 'Los Andes', body: 'asdas', price: '100', comuna_ids: '1' } }
      expect(response).to have_http_status(:ok)
    end
  end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/servicio/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/servicio/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
