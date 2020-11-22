# frozen_string_literal: true

FactoryBot.define do
  factory :servicecomment do
    user { nil }
    body { 'MyText' }
    servicio { nil }
  end
end
