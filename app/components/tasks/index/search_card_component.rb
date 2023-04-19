module Tasks
  module Index
    class SearchCardComponent < ViewComponent::Base
      def initialize(search_params)
        @search_params = search_params # TasksController #search_params
        super
      end
    end
  end
end
