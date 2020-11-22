# frozen_string_literal: true

FactoryBot.define do
  factory :comentarios_servicio do
    servicio { nil }
    user { nil }
    body { 'MyText' }
  end
end
