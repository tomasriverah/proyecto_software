# frozen_string_literal: true

FactoryBot.define do
  factory :servicio do
    title { Faker::Name }
    user { Faker::Name }
    body { Faker::Twitter.text }
    price { 1 }
  end
end
