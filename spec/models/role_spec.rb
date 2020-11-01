# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) do
    role = Role.new
    role.id = rand(1..3)
    role.name = 'Default'
    role.code = 'default'
    role
  end

  describe 'Roles attr' do
    it 'checks name' do
      expect(role.name).to_not be_blank
    end

    it 'checks id' do
      expect(role.id).to_not be_blank
    end

    it 'checks code' do
      expect(role.code).to_not be_blank
    end
  end
end
