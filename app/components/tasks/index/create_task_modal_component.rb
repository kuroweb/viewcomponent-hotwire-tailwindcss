module Tasks
  module Index
    class CreateTaskModalComponent < ViewComponent::Base
      def initialize(element_id)
        @element_id = element_id # type: string
        super
      end
    end
  end
end
