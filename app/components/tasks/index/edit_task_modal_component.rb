module Tasks
  module Index
    class EditTaskModalComponent < ViewComponent::Base
      def initialize(element_id)
        @element_id = element_id # type: string
        super
      end
    end
  end
end
