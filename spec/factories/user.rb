# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Joe' }
    role_id { 2 }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
