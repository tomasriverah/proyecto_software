# frozen_string_literal: true

FactoryBot.define do
  factory :comentarios_carrete do
    user { nil }
    body { 'MyText' }
    carrete { nil }
  end
end
