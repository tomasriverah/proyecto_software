# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Memes', type: :request do
  describe '/memazo' do
    it 'succesfull request' do
      get '/meme/memazo'
      expect(response).to have_http_status(:ok)
    end
    it 'succesfull render' do
      get '/meme/memazo'
      expect(response).to render_template(:memazo)
    end
  end
end
