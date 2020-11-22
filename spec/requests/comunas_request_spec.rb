# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comunas', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/comunas/index'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/comunas/index'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/comunas/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Create comuna' do
    it 'creates a new comuna' do
      post '/comunas', params: { comuna: { nombre: 'Los Andes' } }
      expect(response).to have_http_status(:found)
    end
  end
end
