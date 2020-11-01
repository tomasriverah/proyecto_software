# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    user = User.new
    user.name = Faker::Name
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password(min_length: 6)
    user.role_id = rand(1..3)
    user
  end

  describe 'User attr' do
    it 'checks name' do
      expect(user.name).to_not be_blank
    end

    it 'checks email' do
      expect(user.email).to include('@')
    end

    it 'checks password' do
      expect(user.password.length).to be >= 6
    end
  end
end
