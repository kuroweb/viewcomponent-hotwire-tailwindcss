#============
# テストケース
#============
# Task
#   association
#     belongs_to: user
#       アソシエーション先のUserモデルを取得できること
#   validation
#     .title
#       値が「空文字」の場合
#         バリデーションエラーを返却すること
#       値が「nil」の場合
#         バリデーションエラーを返却すること
#       値が「1文字以上の任意の値」の場合
#         バリデーションエラーを返却しないこと
#     .priority
#       値が「nil」の報合
#         バリデーションエラーを返却すること
#       値が「low」の報合
#         バリデーションエラーを返却しないこと
#       値が「medium」の報合
#         バリデーションエラーを返却しないこと
#       値が「high」の報合
#         バリデーションエラーを返却しないこと
#     .due_date
#       値が「nil」の場合
#         バリデーションエラーを返却すること
#       値が「任意の日付」の場合
#         バリデーションエラーを返却しないこと

require "rails_helper"

RSpec.describe Task do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user:) }

  describe "association" do
    context "belongs_to: user" do
      it "アソシエーション先のUserモデルを取得できること" do
        expect(task.user).to eq(user)
      end
    end
  end

  describe "validation" do
    describe ".title" do
      context "値が「空文字」の場合" do
        before do
          task.title = ""
        end

        it "バリデーションエラーを返却すること" do
          expect(task).not_to be_valid
        end
      end

      context "値が「nil」の場合" do
        before do
          task.title = nil
        end

        it "バリデーションエラーを返却すること" do
          expect(task).not_to be_valid
        end
      end

      context "値が「1文字以上の任意の値」の場合" do
        before do
          task.title = "hoge"
        end

        it "バリデーションエラーを返却しないこと" do
          expect(task).to be_valid
        end
      end
    end

    describe ".summary" do
      # バリデーション未実装
    end

    describe ".priority" do
      context "値が「空文字」の報合" do
        # 仕様上割り当て不可能
      end

      context "値が「nil」の報合" do
        before do
          task.priority = nil
        end

        it "バリデーションエラーを返却すること" do
          expect(task).not_to be_valid
        end
      end

      context "値が「low」の報合" do
        before do
          task.priority = "low"
        end

        it "バリデーションエラーを返却しないこと" do
          expect(task).to be_valid
        end
      end

      context "値が「medium」の報合" do
        before do
          task.priority = "medium"
        end

        it "バリデーションエラーを返却しないこと" do
          expect(task).to be_valid
        end
      end

      context "値が「high」の報合" do
        before do
          task.priority = "high"
        end

        it "バリデーションエラーを返却しないこと" do
          expect(task).to be_valid
        end
      end
    end

    describe ".due_date" do
      context "値が「空文字」の場合" do
        # 仕様上割り当て不可能
      end

      context "値が「nil」の場合" do
        before do
          task.due_date = nil
        end

        it "バリデーションエラーを返却すること" do
          expect(task).not_to be_valid
        end
      end

      context "値が「任意の日付」の場合" do
        before do
          task.due_date = "2020-01-01"
        end

        it "バリデーションエラーを返却しないこと" do
          expect(task).to be_valid
        end
      end
    end
  end
end
