# 検証用ユーザーとタスクを作成
# command:
#   rails db:seed:current_user -e {environment}

ApplicationRecord.transaction do
  # User
  user = User.create!(email: "current_user@example.com", password: "example")

  # Task
  Task.create!(
    user:,
    title: "current_user_task",
    summary: "current_user_summary",
    due_date: Time.current.to_date,
    priority: "low"
  )
end
