# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Carretes', type: :request do
  let(:carrete) do
    Carrete.create(
      title: 'Los Carretazo',
      user_id: 1,
      body: 'asdas',
      fecha: '10-10',
      comuna_id: '1',
      direccion: '1',
      capacidad_maxima: '1',
      max_price: '10',
      min_price: '1'
    )
  end

  let(:creating_params) do
    {
      carrete: {
        title: 'Los Carretazo',
        body: 'asdas',
        fecha: '10-10',
        comuna_id: '1',
        direccion: '1',
        capacidad_maxima: '1',
        max_price: '10',
        min_price: '1'
      }
    }
  end

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

  # describe 'New carrete' do
  #   it 'creates a new carrete' do
  #     Carrete.create(
  #       title: 'Los Carretazo',
  #       user_id: 1,
  #       body: 'asdas',
  #       fecha: '10-10',
  #       comuna_id: '1',
  #       direccion: '1',
  #       capacidad_maxima: '1',
  #       max_price: '10',
  #       min_price: '1')
  #     delete "/carretes/1"
  #     expect(response).to have_http_status(:found)
  #   end
  # end

  describe 'New carrete' do
    it 'creates a new carrete' do
      post '/carretes', params: creating_params
      expect(response).to have_http_status(:found)
    end

    it 'creates a new carrete' do
      post '/carretes', params: creating_params
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe 'GET /services' do
    it 'returns http success' do
      get '/carretes/show', params: { id: '1' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/carretes/show', params: { id: '1' }
      expect(response).to have_http_status(:found)
    end

    it 'returns http success' do
      get '/carretes/show', params: { id: '1' }
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe 'EDIT /carrete' do
    it 'returns http success' do
      get '/carretes/edit', params: { id: '1' }
      expect(response).to have_http_status(:found)
    end

    # it 'returns http success' do
    #   put '/carretes/1'
    #   expect(response).to have_http_status(:found)
    # end
  end

  # describe 'DELETE /carrete' do
  #   it 'deletes carrete' do
  #     post '/carretes', params: creating_params
  #     delete '/carretes/1'
  #     expect(response).to have_http_status(:found)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/carretes/edit"
  #     expect(response).to redirect_to(new_user_session_url)
  #   end
  # end
end
