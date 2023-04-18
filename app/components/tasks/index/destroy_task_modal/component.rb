module Tasks
  module Index
    module DestroyTaskModal
      class Component < ViewComponent::Base
        def initialize(element_id)
          @element_id = element_id # type: string
          super
        end
      end
    end
  end
end
