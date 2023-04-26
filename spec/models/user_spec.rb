require "rails_helper"

RSpec.describe User do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user:) }

  describe "association" do
    context "has_many: tasks" do
      it "アソシエーション先のTaskモデルを取得できること" do
        expect(user.tasks).to include(task)
      end

      it "Userモデルを削除したときに、Taskモデルも削除されること" do
        expect { user.destroy }.to change(Task, :count).by(-1)
      end
    end
  end
end
