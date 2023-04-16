FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:summary) { |n| "summary_#{n}" }
    due_date { "2030-01-01" }
    priority { "low" }
  end
end
