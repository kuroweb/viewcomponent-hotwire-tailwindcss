module Tasks
  module Index
    module SearchCard
      class Component < ViewComponent::Base
        def initialize(search_params)
          @search_params = search_params # TasksController #search_params
          super
        end
      end
    end
  end
end
