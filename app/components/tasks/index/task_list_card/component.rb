module Tasks
  module Index
    module TaskListCard
      class Component < ViewComponent::Base
        def initialize(tasks)
          @tasks = tasks # Task < ApplicationRecord
          super
        end
      end
    end
  end
end
