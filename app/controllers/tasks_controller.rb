class TasksController < ApplicationController
  before_action :authenticate_user!

  helper_method :search_params

  def index
    @tasks = Tasks::SearchFinder.call(relation: current_user.tasks, params: search_params)
  end

  def show; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def search_params
    return {} if params[:search].blank?

    params.require(:search).permit(:title, :summary, :priority, { due_date: %i[start_date end_date] })
  end
end
