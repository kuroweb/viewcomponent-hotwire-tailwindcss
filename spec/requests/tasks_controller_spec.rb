require "rails_helper"

RSpec.describe Tasks, type: :request do
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
    let!(:create_task_params) { attributes_for(:task) }

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
end
