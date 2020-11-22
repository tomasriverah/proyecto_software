# frozen_string_literal: true

FactoryBot.define do
  factory :carrete do
    title { 'MyString' }
    body { 'MyText' }
    user { nil }
    max_price { '' }
    min_price { '' }
  end
end
