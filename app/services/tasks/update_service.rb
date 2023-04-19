# frozen_string_literal: true

# NOTE: Taskレコードを更新するサービスクラス
module Tasks
  class UpdateService
    def self.call(...)
      new(...).call
    end

    def initialize(task:, params:)
      @task = task     # type: Task < ApplicationRecord
      @params = params # type: TasksController #update_task_params
    end

    def call
      return ServiceResponse.error(message: "Tasks::CreateService is failed.", payload: { task: }) if task.nil?

      task.assign_attributes(
        title: params[:title],
        summary: params[:summary],
        due_date: params[:due_date],
        priority: params[:priority]
      )

      if task.save
        ServiceResponse.success(payload: task)
      else
        ServiceResponse.error(message: "Tasks::CreateService is failed.", payload: { task: })
      end
    end

    private

    attr_reader :task, :params
  end
end
