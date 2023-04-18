# frozen_string_literal: true

# NOTE: TaskレコードをINSERTするサービスクラス
module Tasks
  class CreateService
    def self.call(...)
      new(...).call
    end

    def initialize(params:)
      @params = params # type: ApplicationController #task_params
    end

    def call
      task = Task.new(
        user: params[:user],
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

    attr_reader :params
  end
end
