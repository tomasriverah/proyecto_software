# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    author { Faker::Name }
    title { Faker::Book.title } # Faker::Twitter.screen_name,
    tipo { choice(%w[Carrete Servicio]) }
    comment { sFaker::Twitter.status['text'] }
  end
end
