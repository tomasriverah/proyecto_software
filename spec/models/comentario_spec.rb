# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comentario, type: :model do
  let(:comentario) do
    comentario = Comentario.new
    comentario.id = 1
    comentario.author = Faker::Name
    comentario.body = 'malo el carrete'
    comentario
  end

  describe 'Comment attr' do
    it 'checks id' do
      expect(comentario.id).to eq(1)
    end

    it 'checks author' do
      expect(comentario.author).to_not be_blank
    end

    it 'checks password' do
      expect(comentario.body).to_not be_blank
    end
  end
end
