#============
# テストケース
#============
# TaskDecorator
#   #readable_priority
#     整形済みの値を返却すること
#   #readable_due_date
#     整形済みの値を返却すること

require "rails_helper"

RSpec.describe TaskDecorator do
  let!(:task) { create(:task) }

  describe "#readable_priority" do
    it "整形済みの値を返却すること" do
      # low
      task.update(priority: "low")
      expect(task.decorate.readable_priority).to eq("低")

      # medium
      task.update(priority: "medium")
      expect(task.decorate.readable_priority).to eq("中")

      # high
      task.update(priority: "high")
      expect(task.decorate.readable_priority).to eq("高")
    end
  end

  describe "#readable_due_date" do
    it "整形済みの値を返却すること" do
      task.update(due_date: "2020-01-01")
      expect(task.decorate.readable_due_date).to eq("2020/01/01")
    end
  end
end
