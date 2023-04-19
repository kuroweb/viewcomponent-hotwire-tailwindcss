# 検証用ユーザーとタスクを作成
# command:
#   rails db:seed:other_user -e {environment}

ApplicationRecord.transaction do
  # User
  user = User.create!(email: "other_user@example.com", password: "example")

  # Task
  Task.create!(
    user:,
    title: "other_user_task",
    summary: "other_user_summary",
    due_date: Time.current.to_date,
    priority: "low"
  )
end
