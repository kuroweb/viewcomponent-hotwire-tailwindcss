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
      title: "current_user_task_#{i}",
      summary: "current_user_summary_#{i}",
      due_date: Time.current.to_date.since(i),
      priority: Task.priority.values.sample
    )
  end
end
