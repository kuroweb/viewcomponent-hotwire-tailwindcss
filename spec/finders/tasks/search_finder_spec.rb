#============
# テストケース
#============
# Tasks::SearchFinder
#   検索ロジックの動作テスト
#     #title_filter
#       titleが「空文字」の場合
#         titleによる絞り込みが行われないこと
#       titleが「nil」の場合
#         titleによる絞り込みが行われないこと
#       titleが「任意の文字列」の場合
#         titleと任意の文字列が部分一致するTaskレコードを返却すること
#     #summary_filter
#       summaryが「空文字」の場合
#         summaryによる絞り込みが行われないこと
#       summaryが「nil」の場合
#         summaryによる絞り込みが行われないこと
#       summaryが「任意の文字列」の場合
#         summaryと任意の文字列が部分一致するTaskレコードを返却すること
#     #due_date_filter
#       due_dateが「空ハッシュ」の場合
#         due_dateによる絞り込みが行われないこと
#       due_dateが「nil」の場合
#         due_dateによる絞り込みが行われないこと
#       start_dateが「任意の日時」で、end_dateが「任意の日時」の場合
#         due_dateがstart_dateとend_dateの範囲内のTaskレコードを返却すること
#       start_dateが「任意の日時」で、end_dateが「nil」の場合
#         due_dateがstart_date以降のTaskレコードを返却すること
#       start_dateが「nil」で、end_dateが「任意の日時」の場合
#         due_dateがend_date以前のTaskレコードを返却すること
#     #priority_filter
#       priorityが「空文字」の場合
#         priorityによる絞り込みが行われないこと
#       priorityが「nil」の場合
#         priorityによる絞り込みが行われないこと
#       priorityが「low」の場合
#         priorityが「low」なTaskレコードを返却すること
#       priorityが「medium」の場合
#         priorityが「medium」なTaskレコードを返却すること
#       priorityが「high」の場合
#         priorityが「high」なTaskレコードを返却すること

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tasks::SearchFinder do
  describe "検索ロジックの動作テスト" do
    let!(:current_user) { create(:user, :with_tasks) }

    # ダミーデータ作成
    before { create(:user, :with_tasks) }

    describe "#title_filter" do
      before do
        current_user.tasks.each do |task|
          task.update(title: "hoge_title")
        end
      end

      context "titleが「空文字」の場合" do
        it "titleによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, title: "")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "titleが「nil」の場合" do
        it "titleによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, title: nil)

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "titleが「任意の文字列」の場合" do
        it "titleと任意の文字列が部分一致するTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, title: "hoge")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end
    end

    describe "#summary_filter" do
      before do
        current_user.tasks.each do |task|
          task.update(summary: "hoge_summary")
        end
      end

      context "summaryが「空文字」の場合" do
        it "summaryによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, summary: "")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "summaryが「nil」の場合" do
        it "summaryによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, summary: nil)

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "summaryが「任意の文字列」の場合" do
        it "summaryと任意の文字列が部分一致するTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, summary: "hoge")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end
    end

    describe "#due_date_filter" do
      before do
        current_user.tasks.each do |task|
          task.update(due_date: "2020-02-01")
        end
      end

      context "due_dateが「空ハッシュ」の場合" do
        it "due_dateによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, due_date: {})

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "due_dateが「nil」の場合" do
        it "due_dateによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, due_date: nil)

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "start_dateが「任意の日時」で、end_dateが「任意の日時」の場合" do
        it "due_dateがstart_dateとend_dateの範囲内のTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, due_date: { start_date: "2020-01-01", end_date: "2020-03-01" })

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "start_dateが「任意の日時」で、end_dateが「nil」の場合" do
        it "due_dateがstart_date以降のTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, due_date: { start_date: "2020-01-01", end_date: nil })

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "start_dateが「nil」で、end_dateが「任意の日時」の場合" do
        it "due_dateがend_date以前のTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, due_date: { start_date: nil, end_date: "2020-03-01" })

          expect(obj.call).to match_array(current_user.tasks)
        end
      end
    end

    describe "#priority_filter" do
      context "priorityが「空文字」の場合" do
        it "priorityによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, priority: "")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "priorityが「nil」の場合" do
        it "priorityによる絞り込みが行われないこと" do
          obj = described_class.new(current_user.tasks, priority: nil)

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "priorityが「low」の場合" do
        before do
          current_user.tasks.each do |task|
            task.update(priority: "low")
          end
        end

        it "priorityが「low」なTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, priority: "low")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "priorityが「medium」の場合" do
        before do
          current_user.tasks.each do |task|
            task.update(priority: "medium")
          end
        end

        it "priorityが「medium」なTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, priority: "medium")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end

      context "priorityが「high」の場合" do
        before do
          current_user.tasks.each do |task|
            task.update(priority: "high")
          end
        end

        it "priorityが「high」なTaskレコードを返却すること" do
          obj = described_class.new(current_user.tasks, priority: "high")

          expect(obj.call).to match_array(current_user.tasks)
        end
      end
    end
  end
end
