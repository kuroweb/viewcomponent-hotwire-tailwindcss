FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { "12345678" }
  end

  trait :with_tasks do
    after(:create) do |user|
      create_list(:task, 2, user:)
    end
  end
end
