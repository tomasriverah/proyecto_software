# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    user_id { 1 }
    n_text { 'MyText' }
    is_checked { false }
  end
end
