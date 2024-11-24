FactoryBot.define do
  factory :application, class: Doorkeeper::Application do
    name { Faker::App.name }
    redirect_uri { "https://example.com" }
    confidential { false }
  end
end
