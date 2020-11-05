require 'rails_helper'

RSpec.describe Carrete, type: :model do
  let(:carrete) do
    carrete = Carrete.new
    carrete.id = rand(5)
    carrete.title = Faker::Name
    carrete.body = 'malo el carrete'
    carrete.min_price = rand(1000..2000)
    carrete.max_price = rand(3000..5000)
    carrete
  end

  describe 'Comment attr' do
    it 'checks id' do
      id = carrete.get_id
      expect(carrete.id).to eq(id.to_i)
    end

    it 'checks title' do
      expect(carrete.title).to_not be_blank
    end

    it 'checks body' do
      expect(carrete.body).to_not be_blank
    end

    it 'checks that max price is grater than min price' do
      expect(carrete.min_price).to be < carrete.max_price
    end
  end
end
