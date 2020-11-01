# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) do
    post = Post.new
    post.author = 'Pedro'
    post.title = 'Hola'
    post.tipo = 'Servicio'
    post.comment = 'Vendo limpieza'
    post
  end

  describe '#author_and_title_and_tipo' do
    it 'checks author' do
      expect(post.author_and_title_and_tipo).to include(post.author)
    end
  end
end
