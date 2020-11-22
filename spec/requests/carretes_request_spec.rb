# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Carretes', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/carretes/new'
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/carretes/index'
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe 'New carrete' do
    it 'creates a new carrete' do
      post '/carretes', params: { carrete: { title: 'Los Carretazo', body: 'asdas', fecha: '10-10',
                                             comuna_id: '1', direccion: '1', capacidad_maxima: '1',
                                             max_price: '10', min_price: '1' } }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/carretes/show', params: { id: 1 }
      expect(response).to redirect_to(carretes_show_url(id: '1'))
    end
  end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/carretes/edit"
  #     expect(response).to redirect_to(new_user_session_url)
  #   end
  # end
end
