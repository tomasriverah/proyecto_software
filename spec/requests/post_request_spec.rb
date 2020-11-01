# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:creating_params) do
    {
      post: {
        author: 'pedro', # Faker::Twitter.user.name,
        title: 'en el baño', # Faker::Twitter.screen_name,
        tipo: 'Carrete',
        comment: 'disfrutando el baño' # Faker::Twitter.text
      }
    }
  end

  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/post/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET /new' do
    it 'returns http success' do
      get '/post/new'
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/post/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/post/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'CRUD' do
    it 'redirige a index' do
      post '/post#create', params: creating_params
      expect(response).to redirect_to(post_index_path)
    end

    it 'deletes a post' do
      post '/post#create', params: creating_params
      post '/post#destroy', params: creating_params
      expect(response).to redirect_to(post_index_path)
    end

    it 'updates a post' do
      post '/post#update', params: creating_params
      expect(response).to redirect_to(post_index_path)
    end
  end
end
