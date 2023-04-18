class TasksController < ApplicationController
  before_action :authenticate_user!

  helper_method :search_params

  def index
    @tasks = Tasks::SearchFinder.call(relation: current_user.tasks, params: search_params)
  end

  def show; end

  def edit; end

  def create
    result = Tasks::CreateService.call(params: task_params)

    if result.success?
      redirect_to tasks_path, flash: { notice: "タスクを追加しました。" } # rubocop:disable Rails/I18nLocaleTexts
    else
      redirect_to tasks_path, flash: { alert: "タスクを追加できませんでした。" } # rubocop:disable Rails/I18nLocaleTexts
    end
  end

  def update; end

  def destroy; end

  private

  def search_params
    return {} if params[:search].blank?

    params.require(:search).permit(:title, :summary, :priority, { due_date: %i[start_date end_date] })
  end

  def task_params
    params.require(:task).permit(task_attributes).merge(user: current_user)
  end

  def task_attributes
    %i[title summary priority due_date]
  end
end
