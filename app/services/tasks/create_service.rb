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
      task = Task.create(
        user: params[:user],
        title: params[:title],
        summary: params[:summary],
        due_date: params[:due_date],
        priority: params[:priority]
      )

      return ServiceResponse.error(message: "Tasks CreateService is failed.", payload: { task: }) unless task.persisted?

      ServiceResponse.success(payload: task)
    end

    private

    attr_reader :params
  end
end
