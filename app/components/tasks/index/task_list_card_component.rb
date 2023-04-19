module Tasks
  module Index
    class TaskListCardComponent < ViewComponent::Base
      def initialize(tasks)
        @tasks = tasks # Task < ApplicationRecord
        super
      end
    end
  end
end
