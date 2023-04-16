module Layouts
  class BreadcrumbComponent < ViewComponent::Base
    def initialize(values)
      @values = values # [{ name: string, url: string, class_name: string }, ...]
      super
    end
  end
end
