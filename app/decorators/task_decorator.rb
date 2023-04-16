# frozen_string_literal: true

class TaskDecorator < Draper::Decorator
  delegate_all

  READABLE_PRIORITY_MAP = {
    "low" => "低",
    "medium" => "中",
    "high" => "高"
  }.freeze

  def readable_priority
    READABLE_PRIORITY_MAP[priority]
  end

  def readable_due_date
    due_date.strftime("%Y/%m/%d")
  end
end
