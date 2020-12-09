# frozen_string_literal: true

FactoryBot.define do
  factory :default_role do
    id { 1 }
    name { 'Default' }
    code { 'default' }
  end
  factory :admin_role do
    id { 2 }
    name { 'Admin' }
    code { 'admin' }
  end
  factory :service_role do
    id { 3 }
    name { 'Servicio' }
    code { 'servicio' }
  end
end
