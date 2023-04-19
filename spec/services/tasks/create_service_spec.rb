#============
# テストケース
#============
# Tasks::CreateService
#   #call
#     パラメータがすべて正しい場合
#       「ServiceResponse.success」を返却すること
#     「userパラメータ」が不正な場合
#       「ServiceResponse.error」を返却すること
#     「titleパラメータ」が不正な場合
#       「ServiceResponse.error」を返却すること
#     「summaryパラメータ」が不正な場合
#       「ServiceResponse.error」を返却すること
#     「due_dateパラメータ」が不正な場合
#       「ServiceResponse.error」を返却すること
#     「priorityパラメータ」が不正な場合
#       「ServiceResponse.error」を返却すること

require "rails_helper"

RSpec.describe Tasks::CreateService do
  describe "#call" do
    let!(:user) { create(:user) }
    let!(:create_task_params) do
      ActionController::Parameters.new(
        {
          task: {
            title: "title",
            summary: "summary",
            due_date: "2020/01/01",
            priority: "low"
          }
        }
      ).require(:task).permit(%i[title summary priority due_date]).merge(user:)
    end

    context "パラメータがすべて正しい場合" do
      it "「ServiceResponse.success」を返却すること" do
        result = described_class.call(params: create_task_params)
        expect(result.success?).to be(true)
      end
    end

    context "「userパラメータ」が不正な場合" do
      before do
        create_task_params[:user] = nil
      end

      it "「ServiceResponse.error」を返却すること" do
        result = described_class.call(params: create_task_params)
        expect(result.error?).to be(true)
      end
    end

    context "「titleパラメータ」が不正な場合" do
      before do
        create_task_params[:title] = nil
      end

      it "「ServiceResponse.error」を返却すること" do
        result = described_class.call(params: create_task_params)
        expect(result.error?).to be(true)
      end
    end

    context "「summaryパラメータ」が不正な場合" do
      it "「ServiceResponse.error」を返却すること" do
        # MEMO: バリデーション未定義のため実装しない
      end
    end

    context "「due_dateパラメータ」が不正な場合" do
      before do
        create_task_params[:due_date] = nil
      end

      it "「ServiceResponse.error」を返却すること" do
        result = described_class.call(params: create_task_params)
        expect(result.error?).to be(true)
      end
    end

    context "「priorityパラメータ」が不正な場合" do
      before do
        create_task_params[:priority] = nil
      end

      it "「ServiceResponse.error」を返却すること" do
        result = described_class.call(params: create_task_params)
        expect(result.error?).to be(true)
      end
    end
  end
end
