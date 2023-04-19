# frozen_string_literal: true

# NOTE: Taskレコードを削除するサービスクラス
module Tasks
  class DestroyService
    def self.call(...)
      new(...).call
    end

    def initialize(task:)
      @task = task
    end

    def call
      if task.destroy
        ServiceResponse.success
      else
        ServiceResponse.error(message: "Tasks::DestroyService is failed.", payload: { task: })
      end
    end

    private

    attr_reader :task
  end
end
