require "rails_helper"

RSpec.describe Tasks do
  let!(:user) { create(:user) }

  describe "GET #index" do
    before do
      sign_in user
    end

    it "リクエストが成功すること" do
      get tasks_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "リクエスト内容が正常な場合" do
      let!(:create_task_params) { attributes_for(:task).merge(user:) }

      before do
        sign_in user
      end

      it "リクエストが成功すること" do
        post tasks_path, params: { task: create_task_params }
        expect(response).to have_http_status(:found)
      end

      it "タスクが追加されること" do
        expect do
          post tasks_path, params: { task: create_task_params }
        end.to change(Task, :count).by(1)
      end

      it "tasks_pathにリダイレクトされること" do
        post tasks_path, params: { task: create_task_params }
        expect(response).to redirect_to tasks_path
      end
    end

    context "リクエスト内容が不正な場合" do
      # 未実装
    end
  end

  describe "PUT #update" do
    context "リクエスト内容が正常な場合" do
      let!(:task) { create(:task, user:, title: "title") }
      let!(:update_task_params) { attributes_for(:task, title: "hoge") }

      before do
        sign_in user
      end

      it "リクエストが成功すること" do
        put task_path(task.id), params: { task: update_task_params }
        expect(response).to have_http_status(:found)
      end

      it "タスクのタイトルが更新されること" do
        expect do
          put task_path(task.id), params: { task: update_task_params }
          task.reload
        end.to change(task, :title).from("title").to("hoge")
      end

      it "tasks_pathにリダイレクトされること" do
        put task_path(task.id), params: { task: update_task_params }
        expect(response).to redirect_to tasks_path
      end
    end

    context "リクエスト内容が不正な場合" do
      # 未実装
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in user
      create(:task, user:)
    end

    it "リクエストが成功すること" do
      delete task_path(Task.last.id)
      expect(response).to have_http_status(:found)
    end

    it "タスクが削除されること" do
      expect do
        delete task_path(Task.last.id)
      end.to change(Task, :count).by(-1)
    end

    it "tasks_pathにリダイレクトされること" do
      delete task_path(Task.last.id)
      expect(response).to redirect_to tasks_path
    end
  end
end
