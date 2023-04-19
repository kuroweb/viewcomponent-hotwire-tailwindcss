module Tasks
  module Index
    class TaskListCardComponent < ViewComponent::Base
      def initialize(tasks, search_params)
        @tasks = tasks                 # Task < ApplicationRecord
        @search_params = search_params # type: TasksController #search_params
        super
      end
    end
  end
end
