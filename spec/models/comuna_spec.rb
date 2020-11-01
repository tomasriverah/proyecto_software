# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comuna, type: :model do
  let(:comuna) do
    comuna = Comuna.new
    comuna.id = rand(1..32)
    comuna.nombre = Faker::Address.community
    comuna
  end

  describe 'Comuna attr' do
    it 'checks name' do
      expect(comuna.nombre).to_not be_blank
    end

    it 'checks id' do
      expect(comuna.id).to_not be_blank
    end
  end
end
