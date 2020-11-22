# frozen_string_literal: true

FactoryBot.define do
  factory :servicio do
    title { 'MyString' }
    user { nil }
    body { 'MyText' }
    price { 1 }
  end
end
