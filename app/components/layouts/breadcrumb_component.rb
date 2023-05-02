module Layouts
  class BreadcrumbComponent < ViewComponent::Base
    def initialize(values)
      @values = values # type: { name: string, url: string | nil, class_name: string }[]
      super
    end
  end
end
