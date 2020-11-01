# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let(:creating_params) do
    {
      user: {
        id: 1, # Faker::Twitter.user.name,
        email: Faker::Internet.email, # 'pedro@gmail.com',#Faker::Twitter.screen_name,
        encrypted_password: 'Carrete',
        role_id: 2, # Faker::Twitter.text
        comunas_id: 15,
        name: Faker::Name
      }
    }
  end

  # describe "GET /profile" do
  #   it "returns http success" do
  #     post "/profile#make_admin"
  #     expect(response).to redirect_to(root_url)
  #   end
  # end
end
