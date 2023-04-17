class TasksController < ApplicationController
  before_action :authenticate_user!

  helper_method :search_params

  def index
    @tasks = current_user.tasks

    # @tasks = Tasks::SearchFinder.call(current_user.tasks, **search_params)
  end

  def show; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def search_params
    return {} if params[:search].blank?

    params.require(:search).permit(:title, :summary, :due_date, :priority)
  end
end
