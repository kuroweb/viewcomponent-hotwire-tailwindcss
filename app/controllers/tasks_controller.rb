class TasksController < ApplicationController
  before_action :authenticate_user!

  helper_method :search_params, :paginate_params

  def index
    @tasks = Tasks::SearchFinder.call(relation: current_user.tasks, params: search_params)
                                .order(created_at: :desc)
                                .page(paginate_params[:page])
  end

  def create
    result = Tasks::CreateService.call(params: create_task_params)

    if result.success?
      redirect_to tasks_path(search: search_params, paginate: paginate_params), flash: { notice: "タスクを追加しました。" } # rubocop:disable Rails/I18nLocaleTexts
    else
      redirect_to tasks_path(search: search_params, paginate: paginate_params), flash: { alert: "タスクを追加できませんでした。" } # rubocop:disable Rails/I18nLocaleTexts
    end
  end

  def update
    task = Task.find_by(id: params[:id], user_id: current_user.id)

    return redirect_to tasks_path, flash: { alert: "タスクが見つかりませんでした。" } if task.nil? # rubocop:disable Rails/I18nLocaleTexts

    result = Tasks::UpdateService.call(task:, params: update_task_params)

    if result.success?
      redirect_to tasks_path(search: search_params, paginate: paginate_params), flash: { notice: "タスクを更新しました。" } # rubocop:disable Rails/I18nLocaleTexts
    else
      redirect_to tasks_path(search: search_params, paginate: paginate_params), flash: { alert: "タスクを更新できませんでした。" } # rubocop:disable Rails/I18nLocaleTexts
    end
  end

  def destroy
    task = Task.find_by(id: params[:id], user_id: current_user.id)

    return redirect_to tasks_path, flash: { alert: "タスクが見つかりませんでした。" } if task.nil? # rubocop:disable Rails/I18nLocaleTexts

    result = Tasks::DestroyService.call(task:)

    if result.success?
      redirect_to tasks_path(search: search_params, paginate: paginate_params), flash: { notice: "タスクを削除しました。" } # rubocop:disable Rails/I18nLocaleTexts
    else
      redirect_to tasks_path(search: search_params, paginate: paginate_params), flash: { alert: "タスクを削除できませんでした。" } # rubocop:disable Rails/I18nLocaleTexts
    end
  end

  private

  def search_params
    return {} if params[:search].blank?

    params.require(:search).permit(:title, :summary, :priority, { due_date: %i[start_date end_date] })
  end

  def paginate_params
    return {} if params[:paginate].blank?

    params.require(:paginate).permit(:page, :per_page)
  end

  def create_task_params
    params.require(:task).permit(task_attributes).merge(user: current_user)
  end

  def update_task_params
    params.require(:task).permit(task_attributes)
  end

  def task_attributes
    %i[title summary priority due_date]
  end
end
