# 検証用ユーザーとタスクを作成
# command:
#   rails db:seed:other_user -e {environment}

ApplicationRecord.transaction do
  # User
  user = User.create!(email: "other_user@example.com", password: "example")

  # Task
  50.times do |i|
    Task.create!(
      user:,
      title: "current_user_task_#{i + 1}",
      summary: "current_user_summary_#{i + 1}",
      due_date: Time.current.to_date.since(i + 1),
      priority: Task.priority.values.sample
    )
  end
end
