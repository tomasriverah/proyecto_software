# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Servicios', type: :request do
  # let {:servicio} {create(:servicio)}
  let(:creating_params) do
    {
      servicio:
      {
        id: '1',
        title: 'Los Andes',
        body: 'asdas',
        price: '100',
        comuna_ids: '1'
      }
    }
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/servicio/index'
      expect(response).to have_http_status(:found)
    end
  end

  # describe 'GET /index' do
  #   it 'returns http success' do
  #     get '/servicio/admin_index'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET /new' do
    it 'returns http success' do
      get '/servicio/new'
      expect(response).to have_http_status(:found)
    end

  #   it 'renders new template' do
  #     get '/servicio/new'
  #     expect(response).to render_template(new_user_session_url)
  #   end
  end

  describe 'New Service' do
    it 'creates a new service' do
      post '/servicio', params: creating_params
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'New Service' do
  #   it 'creates a new service' do
  #     # Comuna.create(id: '1', nombre: 'Los Andes')
  #     # @servicio = Servicio.new
  #     # @servicio.id = '1'
  #     # @servicio.comuna_ids = '1'
  #     # # Servicio.create(
  #     # #   id: 1,
  #     # #   title: 'Los Andes',
  #     # #   body: 'asdas',
  #     # #   price: '100',
  #     #   comuna_ids: '1')
  #     post '/servicio', params: creating_params
  #     delete '/servicio/1'      
  #   end
  # end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/servicio/show", params: {id: '1'}
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
